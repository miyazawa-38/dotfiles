return {
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("vscode").setup({
        -- 好みに合わせてカスタマイズ可能
        transparent = false, -- 背景を透明にする場合は true
        -- italic_comments = true, -- コメントを斜体にする
        underline_links = true, -- リンクに下線を引く
        disable_nvimtree_bg = true, -- サイドバーの背景を統一
        color_overrides = {
          -- vscBack はエディタ全体の背景色です
          -- #000000（漆黒）より少しだけ明るい #0c0c0c に設定
          -- vscBack = "#0c0c0c",
          vscBack = "#1a1a1a",
        },
      })
      -- テーマを適用
      require("vscode").load()
    end,
  },
  -- LazyVim本体にこのテーマを使うよう指示
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },
}
