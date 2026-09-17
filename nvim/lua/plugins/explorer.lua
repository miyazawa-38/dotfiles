return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            -- ファイルを開いたら explorer を自動で閉じる
            jump = { close = true },
          },
        },
      },
    },
  },
}
