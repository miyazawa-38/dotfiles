return {
  -- LSPの設定を拡張する
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Masonで入れたomnisharpを有効化
        omnisharp = {
          handlers = {
            ["textDocument/definition"] = function(...)
              return require("omnisharp_extended").handler(...)
            end,
          },
          keys = {
            {
              "gd",
              function()
                require("omnisharp_extended").lsp_definition()
              end,
              desc = "Goto Definition",
            },
          },
          enable_roslyn_analyzers = true,
          organize_imports_on_format = true,
          enable_import_completion = true,
        },
      },
    },
  },

  -- OmniSharpの機能を拡張するプラグイン（定義ジャンプを正確にするため）
  {
    "Hoffs/omnisharp-extended-lsp.nvim",
    lazy = true,
  },

  -- フォーマッターの設定を追加
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- C#ファイルに対して csharpier を使用する設定
        cs = { "csharpier" },
      },
    },
  },
}
