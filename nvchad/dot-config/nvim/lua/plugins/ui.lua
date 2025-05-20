return {
  {
    "rcarriga/nvim-notify",
    lazy = false,
    opts = {
      background_colour = "#000000",
      render = "compact",
      stages = "fade_in_slide_out",
      timeout = 2000,
    },
    config = function(_, opts)
      local notify = require("notify")
      notify.setup(opts)
      vim.notify = notify
    end,
  },
  {
    "stevearc/dressing.nvim",
    lazy = false,
    opts = {},
  },
  {
    "stevearc/quicker.nvim",
    event = "FileType qf",
    opts = {},
  },
}
