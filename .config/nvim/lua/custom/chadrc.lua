---@type ChadrcConfig
local M = {}
M.ui = {
  theme = 'catppuccin',
  statusline = {
    theme = 'default',
    separator_style = "arrow"
  }
}
M.plugins = 'custom.plugins'
M.mappings = require 'custom.mappings'
return M
