return {
  -- LSPの設定
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- matlab_ls を Octave ファイルにも適用
        matlab_ls = {
          filetypes = { "matlab", "octave" },
          settings = {
            matlab = {
              indexWorkspace = false,
              installPath = "",
            },
          },
        },
      },
    },
  },
}
