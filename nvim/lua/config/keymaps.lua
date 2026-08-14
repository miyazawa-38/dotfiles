-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- インサートモード中に”jj”でノーマルモードに戻る
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode with jj" })

-- 保存を早くする（ctrl+s）
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- 画面分割した時の移動を楽にする（Ctrl + hjkl でウィンドウ移動）
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window" })

-- Ctrl + 矢印キーでウィンドウサイズを調整
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- F5 キーで現在の C++ ファイルをコンパイルして実行する
vim.keymap.set("n", "<F5>", function()
  -- 保存してから実行
  vim.cmd("write")
  -- ターミナルを開いて g++ でビルドして実行
  vim.cmd("term g++ -O3 % -o %:p:r && %:p:r")
end, { desc = "Compile and Run C++" })

-- Markdown 用の F5 キー設定例
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- ターミナルのページャーを強制する
    vim.keymap.set("n", "<F5>", ":vsplit | term glow -p %<CR>", { buffer = true })
  end,
})

-- Octave スクリプトを実行する設定
vim.api.nvim_create_autocmd("FileType", {
  pattern = "octave",
  callback = function()
    vim.keymap.set("n", "<F5>", ":split | term octave %<CR>", { buffer = true, desc = "Run Octave script" })
  end,
})

-- Markdownファイル時のみ Marp プレビューを起動する (Leader + m + p)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- -- -p オプションでブラウザプレビューを起動
    -- vim.keymap.set("n", "<leader>mp", ":vsplit | term marp -p %<CR>", { buffer = true, desc = "Marp Preview" })
    --
    -- -- Windows の Brave を使用してプレビューする
    -- -- CHROME_PATH に Windows 側の Brave の実行パスを渡します
    -- vim.keymap.set("n", "<leader>mp", function()
    --   local brave_path = "/mnt/c/Program\\ Files/Google/Chrome/Application/chrome.exe"
    --   local cmd = string.format("vsplit | term CHROME_PATH=%s marp --browser chrome -p %%", brave_path)
    --   vim.cmd(cmd)
    -- end, { buffer = true, desc = "Marp Preview (Brave Windows)" })

    -- BROWSER 環境変数に wslview (Windows の規定のブラウザを呼ぶツール) を指定
    vim.keymap.set("n", "<leader>mp", ":vsplit | term BROWSER=wslview marp -p %<CR>", { buffer = true })
  end,
})

-- <Space> h で新しいダッシュボード（Snacks）を開く
-- vim.keymap.set("n", "<leader>h", function()
--  Snacks.dashboard.open()
-- end, { desc = "Dashboard" })
