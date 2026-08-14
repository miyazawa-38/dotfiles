-- ~/.config/nvim/lua/plugins/formatting.lua
return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- eruby.yaml ファイルに対しても prettier で整形を実行する
        ["eruby.yaml"] = { "prettier" },
        ["yaml"] = { "prettier" },
        -- erb_format を無効化（LazyVim デフォルトの erb-format を使わない）
        ["eruby"] = {},
      },
    },
  },
}
