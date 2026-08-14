-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- HTML LSPの設定
        html = {
          -- 標準では html しか見ないので、eruby を追加
          filetypes = { "html", "javascriptreact", "typescriptreact", "eruby" },
        },
        -- Emmet LSPの設定（無効化）
        emmet_ls = {
          enabled = false,
        },
      },
    },
  },
}
