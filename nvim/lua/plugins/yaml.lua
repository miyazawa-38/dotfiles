-- ~/.config/nvim/lua/plugins/yaml.lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        yamlls = {
          -- 監視するファイルタイプに eruby.yaml を追加
          filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab", "eruby.yaml" },
          settings = {
            yaml = {
              schemaStore = {
                enable = true,
              },
            },
          },
        },
      },
    },
  },
}
