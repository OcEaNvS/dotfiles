local M = {}

local override = require "custom.plugins.override"
local userPlugins = require "custom.plugins"

-- Installing custom plugins and customizing the plugin settings.
M.plugins = {
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig"
    },
  },

  override = {
    ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
    ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
  },

  user = userPlugins,
}

-- Changing the theme to Dracula
M.ui = {
   theme = "chadracula",
}

return M
