-- Use your favorite package manager to install, for example in lazy.nvim
--  Optionally, you can also install nvim-telescope/telescope.nvim to use some search functionality.
local dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" }
local plugin = {
  "sourcegraph/sg.nvim",
  enabled = true,
  dependencies = dependencies,
}
return plugin
