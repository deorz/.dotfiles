local M = require("nvchad.configs.telescope")
local actions = require("telescope.actions")

M.defaults.mappings = {
  n = {
    ["q"] = actions.close,
    ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
  },
  i = {
    ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
    ["<C-s>"] = actions.select_horizontal,
    ["<C-x>"] = false,
  },
}

M.pickers = {
  buffers = {
    sort_mru = true,
    sort_lastused = true,
    ignore_current_buffer = true,
    mappings = {
      i = { ["<C-x>"] = "delete_buffer" },
      n = { ["d"] = "delete_buffer" },
    },
  },
  grep_string = {
    additional_args = { "--hidden", "--no-ignore" },
  },
  live_grep = {
    additional_args = { "--hidden", "--no-ignore" },
  },
}

return M
