-- ~/.config/nvim/lua/plugins/ui.lua
return {
  {
    "windwp/nvim-ts-autotag",
    opts = {
      -- 自動で閉じる機能を有効にするファイルタイプに eruby を追加
      filetypes = {
        "html",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        "svelte",
        "vue",
        "tsx",
        "jsx",
        "rescript",
        "xml",
        "php",
        "markdown",
        "astro",
        "eruby",
      },
    },
  },
}
