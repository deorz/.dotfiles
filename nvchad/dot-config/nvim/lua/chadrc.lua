---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "everforest",
  transparency = true,
}

M.nvdash = { load_on_startup = true }

M.ui = {
  tabufline = {
    enabled = false,
  },
  statusline = {
    theme = "minimal",
    separator_style = "block",
  },
}

return M
