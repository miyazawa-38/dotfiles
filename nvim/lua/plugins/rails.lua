return {
  -- Rails開発の神プラグイン
  { "tpope/vim-rails" },
  -- Ruby LSPの設定を少しカスタマイズ（任意）
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruby_lsp = {
          -- Railsのインデックス作成を有効にする設定などが必要な場合に記述
        },
      },
    },
  },
}
