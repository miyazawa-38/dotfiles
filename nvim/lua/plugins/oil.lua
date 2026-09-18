return {
  -- snacks explorer の <leader>e / <leader>E を外す
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>e", false },
      { "<leader>E", false },
    },
  },

  {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = { "nvim-mini/mini.icons" },
    keys = {
      { "<leader>e", "<cmd>Oil<cr>", desc = "Oil (current file dir)" },
      {
        "<leader>E",
        function()
          require("oil").open(vim.fn.getcwd())
        end,
        desc = "Oil (cwd)",
      },
      { "-", "<cmd>Oil<cr>", desc = "Open parent directory (oil)" },
    },
    opts = {
      default_file_explorer = true,
      view_options = { show_hidden = true },
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
    },
    config = function(_, opts)
      require("oil").setup(opts)
      -- git status をファイル名の後ろに表示する
      require("config.oil_git").setup()
    end,
  },
}
