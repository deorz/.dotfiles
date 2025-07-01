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
  -- {
  --   "m4xshen/hardtime.nvim",
  --   lazy = false,
  --   enabled = false,
  --   dependencies = { "MunifTanjim/nui.nvim" },
  --   opts = {},
  -- },
  -- {
  --   "tris203/precognition.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     startVisible = true,
  --     showBlankVirtLine = true,
  --     highlightColor = { link = "Comment" },
  --     hints = {
  --          Caret = { text = "^", prio = 2 },
  --          Dollar = { text = "$", prio = 1 },
  --          MatchingPair = { text = "%", prio = 5 },
  --          Zero = { text = "0", prio = 1 },
  --          w = { text = "w", prio = 10 },
  --          b = { text = "b", prio = 9 },
  --          e = { text = "e", prio = 8 },
  --          W = { text = "W", prio = 7 },
  --          B = { text = "B", prio = 6 },
  --          E = { text = "E", prio = 5 },
  --     },
  --     gutterHints = {
  --         G = { text = "G", prio = 10 },
  --         gg = { text = "gg", prio = 9 },
  --         PrevParagraph = { text = "{", prio = 8 },
  --         NextParagraph = { text = "}", prio = 8 },
  --     },
  --     disabled_fts = {
  --         "startify",
  --     },
  --   },
  -- },
}
