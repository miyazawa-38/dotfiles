return {
  {
    "lervag/vimtex",
    lazy = false,
    config = function()
      -- OS判定
      local is_mac = vim.fn.has("macunix") == 1

      if is_mac then
        -- Macの設定 (Skimを使用)
        vim.g.vimtex_view_method = "skim"
        vim.g.vimtex_view_skim_sync = 1
        vim.g.vimtex_view_skim_activate = 1
      else
        -- Windows/WSLの設定 (既存の設定)
        vim.g.vimtex_view_general_viewer = "/mnt/c/Users/hokudai/AppData/Local/SumatraPDF/SumatraPDF.exe"
        vim.g.vimtex_view_general_options = "-reuse-instance @pdf"
      end

      -- 共通設定
      vim.g.vimtex_compiler_latexmk = {
        out_dir = "output",
        options = {
          "-shell-escape",
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
      }
      vim.g.vimtex_view_automatic = 1

      -- 隠し表示の無効化（既存の設定を維持）
      vim.g.vimtex_syntax_conceal = {
        additions = 0,
        bibtex = 0,
        greek = 0,
        math_bounds = 0,
        math_delimiters = 0,
        math_fracs = 0,
        math_symbols = 0,
        math_super_sub = 0,
        sections = 0,
        styles = 0,
      }
    end,
  },
}
