-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

-- 行番号を「相対番号」にする
vim.opt.relativenumber = true

-- カーソルがある行をハイライトする（どこにいるか見失わない）
vim.opt.cursorline = true

-- 検索時に大文字小文字を区別しない
vim.opt.ignorecase = true
-- ただし、大文字を混ぜて検索したら区別する（賢い検索）
vim.opt.smartcase = true

-- カーソルの上下に常に10行の余白をもたせる
vim.opt.scrolloff = 10

-- インデント設定（半角スペース4つが一般的）
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true -- タブ入力をスペースに変換

-- クリップボードを使えるようにする
vim.opt.clipboard = "unnamedplus"

-- すべてのファイルで隠し文字を無効化する
vim.opt.conceallevel = 0

-- マウス操作を有効にする（たまに使うと便利）
-- vim.opt.mouse = "a"

-- .m ファイルを matlab (octave) として認識させる
vim.filetype.add({
  extension = {
    m = "matlab",
  },
})

-- ~/.config/nvim/lua/config/options.lua
vim.filetype.add({
  extension = {
    qmd = "quarto",
  },
})

-- ~/.config/nvim/lua/config/options.lua
-- eruby.yaml ファイルに yaml の Treesitter ハイライトを適用する
vim.treesitter.language.register("yaml", "eruby.yaml")
