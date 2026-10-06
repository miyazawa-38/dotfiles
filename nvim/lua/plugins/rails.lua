return {
  { "tpope/vim-rails" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Mason ではなく、mise の Ruby に入れた ruby-lsp を使う
        ruby_lsp = { mason = false },
        -- 単体の rubocop は止めて、ruby-lsp の RuboCop アドオン（プロジェクトの gem で動く）に任せる
        rubocop = { enabled = false },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      -- 整形も ruby-lsp 経由の rubocop に任せる（LSP にフォールバック）
      formatters_by_ft = { ruby = {} },
    },
  },
}
