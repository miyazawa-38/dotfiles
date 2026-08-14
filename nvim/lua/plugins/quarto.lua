-- ~/.config/nvim/lua/plugins/quarto.lua

return {
  -- Quarto 本体のプラグイン
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      lspFeatures = {
        -- コードブロック内での補完や定義ジャンプを有効にする
        languages = { "python", "cpp", "lua", "octave", "matlab" },
        chunks = "all",
        diagnostics = {
          enabled = true,
          triggers = { "BufWritePost" },
        },
        completion = {
          enabled = true,
        },
      },
    },
    ft = { "quarto", "markdown" },
  },

  -- コードブロック内での LSP 機能を支えるプラグイン
  {
    "jmbuhr/otter.nvim",
    opts = {},
  },

  -- Treesitter で quarto のハイライトを有効化
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "quarto", "markdown", "markdown_inline" })
      end
    end,
  },

  -- marksman を quarto filetype にアタッチする（Neovim 0.11 ネイティブ方式）
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.marksman = {
        filetypes = { "markdown", "quarto" },
        single_file_support = true,
      }
    end,
  },
}
