-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- 標準 CSS 用 LSP
        cssls = {},
        -- 既存の html 設定
        html = {
          filetypes = { "html", "javascriptreact", "typescriptreact", "eruby" },
        },
        -- 既存の emmet 設定（css も対象に入っているか確認）
        emmet_ls = {
          filetypes = { "html", "eruby", "javascriptreact", "typescriptreact", "css", "sass", "scss", "less" },
        },
        -- 既存の tailwindcss
        tailwindcss = {},
      },
    },
  },
}
