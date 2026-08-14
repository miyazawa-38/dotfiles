-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- ERBファイルでは自動フォーマットを無効化（HTML LSP が ERB を正しく整形できないため）
vim.api.nvim_create_autocmd("FileType", {
  pattern = "eruby",
  callback = function()
    vim.b.autoformat = false
  end,
})

-- Markdownファイルで赤線（診断・スペルチェック）を徹底的に排除する
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text", "plaintex" },
  callback = function()
    -- 1. スペルチェックを強制オフ
    vim.opt_local.spell = false
    -- 2. 診断機能（赤線）を、このファイルだけ完全に無効化
    vim.diagnostic.enable(false, { bufnr = 0 })
    -- 3. もし他のプラグインが下線を引いている場合、それも消す
    vim.cmd("syntax spell notoplevel")
  end,
})
