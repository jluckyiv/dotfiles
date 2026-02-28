return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              experimentalWorkspaceModule = true,
            },
          },
          root_dir = require("lspconfig.util").root_pattern("go.work", "go.mod", ".git"),
        },
      },
    },
  },
}
