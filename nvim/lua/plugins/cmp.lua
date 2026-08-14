-- ~/.config/nvim/lua/plugins/cmp.lua

return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      -- "buffer" (日本語など) と "snippets" (長いテンプレート) を両方除外する
      opts.sources.default = vim.tbl_filter(function(source)
        -- snippets と luasnip (スニペットエンジン) の両方を念のため除外
        return source ~= "buffer" and source ~= "snippets" and source ~= "luasnip"
      end, opts.sources.default)
    end,
  },
}
