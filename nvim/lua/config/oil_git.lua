-- oil のバッファに git status をファイル名の後ろ（行末）に表示する
--
-- oil-git-status.nvim は extmark の sign_text を使う実装なので行頭固定になる。
-- 同等のロジック（非同期実行・ディレクトリ配下の変更の伝播）を virt_text で行う。

local M = {}

local ns = vim.api.nvim_create_namespace("oil_git_eol")

-- 最長のファイル名と状態表示の間にあける桁数
local STATUS_GAP = 2

-- git status のコード -> ハイライトグループの接尾辞
local suffix_for_code = {
  ["!"] = "Ignored",
  ["?"] = "Untracked",
  ["A"] = "Added",
  ["C"] = "Copied",
  ["D"] = "Deleted",
  ["M"] = "Modified",
  ["R"] = "Renamed",
  ["T"] = "TypeChanged",
  ["U"] = "Unmerged",
}

local function hl_group(code, is_index)
  return "OilGitStatus" .. (is_index and "Index" or "WorkingTree") .. (suffix_for_code[code] or "Unmodified")
end

-- git は '\file".md' を `"\\file\".md"` の形で返す
local function unquote(s)
  local out = s:gsub('"(.*)"', "%1"):gsub('\\"', '"'):gsub("\\\\", "\\")
  return out
end

--- git status --short の出力を { [name] = { index, working_tree } } に変換する。
--- サブディレクトリ配下の変更は、その直下のディレクトリ名に M として集約する。
local function parse(stdout)
  local status = {}

  for _, line in ipairs(vim.split(stdout, "\n")) do
    if line ~= "" then
      local index_code = line:sub(1, 1)
      local work_code = line:sub(2, 2)
      local path = line:sub(4)

      -- リネームは "old -> new" 形式なので新しい方を採用する
      local arrow = path:find(" %-> ")
      if arrow then
        path = path:sub(arrow + 4)
      end

      path = unquote(path)
      path = path:gsub("/$", "")

      local slash = path:find("/")
      if slash then
        -- 配下のファイル -> 直下のディレクトリに集約
        local dir = path:sub(1, slash - 1)
        local cur = status[dir]
        if cur then
          if index_code ~= " " then
            cur.index = "M"
          end
          if work_code ~= " " then
            cur.working_tree = "M"
          end
        else
          status[dir] = { index = index_code, working_tree = work_code }
        end
      else
        status[path] = { index = index_code, working_tree = work_code }
      end
    end
  end

  return status
end

--- oil バッファのパス（oil:// -> 実パス）を返す
local function buffer_path(bufnr)
  local url = vim.api.nvim_buf_get_name(bufnr)
  local file_url = url:gsub("^oil", "file")
  return vim.uri_to_fname(file_url)
end

local function render(bufnr, status)
  if not vim.api.nvim_buf_is_valid(bufnr) then
    return
  end

  local oil = require("oil")
  vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)

  -- 最長行の右に数文字あけた位置に揃える
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local column = 0
  for _, text in ipairs(lines) do
    column = math.max(column, vim.fn.strdisplaywidth(text))
  end
  column = column + STATUS_GAP

  for line = 1, vim.api.nvim_buf_line_count(bufnr) do
    local entry = oil.get_entry_on_line(bufnr, line)
    if entry and entry.name ~= ".." then
      local codes = status[entry.name]
      if codes and not (codes.index == " " and codes.working_tree == " ") then
        -- 1文字だけ表示する。working tree を優先し、無ければ index を出す
        local is_index = codes.working_tree == " "
        local code = is_index and codes.index or codes.working_tree

        vim.api.nvim_buf_set_extmark(bufnr, ns, line - 1, 0, {
          virt_text = { { code, hl_group(code, is_index) } },
          -- 最長のファイル名の右で1列に揃える
          virt_text_win_col = column,
          hl_mode = "combine",
        })
      end
    end
  end
end

--- @param bufnr integer
function M.refresh(bufnr)
  if not vim.api.nvim_buf_get_name(bufnr):find("^oil:") then
    return
  end

  local cwd = buffer_path(bufnr)

  vim.system(
    { "git", "-c", "core.quotepath=false", "-c", "status.relativePaths=true", "status", ".", "--short" },
    { text = true, cwd = cwd },
    function(result)
      if result.code ~= 0 then
        return
      end

      local status = parse(result.stdout)

      vim.schedule(function()
        render(bufnr, status)

        -- oil のバッファを編集すると行がずれるので、キャッシュした結果で貼り直す
        if not vim.b[bufnr].oil_git_eol_attached then
          vim.b[bufnr].oil_git_eol_attached = true
          vim.api.nvim_create_autocmd("TextChanged", {
            buffer = bufnr,
            callback = function()
              render(bufnr, status)
            end,
          })
        end
      end)
    end
  )
end

function M.setup()
  -- 既に定義済みなら colorscheme 側を尊重する（default = true）
  vim.api.nvim_set_hl(0, "OilGitStatusIndex", { link = "DiagnosticSignInfo", default = true })
  vim.api.nvim_set_hl(0, "OilGitStatusWorkingTree", { link = "DiagnosticSignWarn", default = true })
  for _, suffix in pairs(vim.tbl_extend("force", suffix_for_code, { [" "] = "Unmodified" })) do
    vim.api.nvim_set_hl(0, "OilGitStatusIndex" .. suffix, { link = "OilGitStatusIndex", default = true })
    vim.api.nvim_set_hl(0, "OilGitStatusWorkingTree" .. suffix, { link = "OilGitStatusWorkingTree", default = true })
  end

  local group = vim.api.nvim_create_augroup("OilGitEol", { clear = true })

  vim.api.nvim_create_autocmd("User", {
    group = group,
    pattern = "OilEnter",
    callback = function(args)
      M.refresh(args.data.buf)
    end,
  })

  -- ファイル操作（作成・削除・リネーム）の後に貼り直す
  vim.api.nvim_create_autocmd("User", {
    group = group,
    pattern = "OilMutationComplete",
    callback = function()
      for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(bufnr) then
          M.refresh(bufnr)
        end
      end
    end,
  })
end

return M
