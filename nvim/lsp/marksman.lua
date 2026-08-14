return {
  filetypes = { "markdown", "quarto" },
  root_dir = function(bufnr)
    return vim.fs.root(bufnr, { ".git", ".marksman.toml" })
      or vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr))
  end,
  single_file_support = true,
}
