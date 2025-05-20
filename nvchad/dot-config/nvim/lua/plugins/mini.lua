return {
  {
    "echasnovski/mini.files",
    version = false,
    opts = {
      windows = {
        max_number = 1,
        preview = false,
      },
    },
    keys = {
      {
        "<leader>ee",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        "n",
        noremap = true,
        silent = true,
        desc = "Open file explorer",
      },
    },
  },
  {
    "echasnovski/mini.ai",
    event = "User FilePost",
    version = "*",
    opts = {},
  },
  {
    "echasnovski/mini.splitjoin",
    event = "User FilePost",
    version = "*",
    opts = {},
  },
  {
    "echasnovski/mini.surround",
    event = "User FilePost",
    version = "*",
    opts = {
      mappings = {
        add = "ysa",
        delete = "ysd",
        find = "ysf",
        find_left = "ysF",
        highlight = "ysh",
        replace = "ysr",
        update_n_lines = "ysn",
      },
    },
  },
  {
    "echasnovski/mini.bracketed",
    event = "User FilePost",
    version = "*",
    opts = {},
  },
}
