return {
  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
  },

  {
    "mrjones2014/smart-splits.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<C-h>",
        function()
          require("smart-splits").move_cursor_left()
        end,
        "n",
        noremap = true,
        silent = true,
        desc = "Move Cursor Left",
      },
      {
        "<C-j>",
        function()
          require("smart-splits").move_cursor_down()
        end,
        "n",
        noremap = true,
        silent = true,
        desc = "Move Cursor Down",
      },
      {
        "<C-k>",
        function()
          require("smart-splits").move_cursor_up()
        end,
        "n",
        noremap = true,
        silent = true,
        desc = "Move Cursor Up",
      },
      {
        "<C-l>",
        function()
          require("smart-splits").move_cursor_right()
        end,
        "n",
        noremap = true,
        silent = true,
        desc = "Move Cursor Right",
      },
      {
        "<C-Left>",
        function()
          require("smart-splits").resize_left()
        end,
        "n",
        noremap = true,
        silent = true,
        desc = "Resize Left",
      },
      {
        "<C-Down>",
        function()
          require("smart-splits").resize_down()
        end,
        "n",
        noremap = true,
        silent = true,
        desc = "Resize Down",
      },
      {
        "<C-Up>",
        function()
          require("smart-splits").resize_up()
        end,
        "n",
        noremap = true,
        silent = true,
        desc = "Resize Up",
      },
      {
        "<C-Right>",
        function()
          require("smart-splits").resize_right()
        end,
        "n",
        noremap = true,
        silent = true,
        desc = "Resize Right",
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = require("configs.conform"),
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ lsp_format = "fallback", async = true })
        end,
        mode = { "n", "v" },
        noremap = true,
        silent = true,
        desc = "Format file",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lspconfig")
    end,
  },

  -- test new blink
  { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "http",
        "json",
        "javascript",
        "typescript",
        "tsx",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "go",
        "regex",
        "toml",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },
    },
  },
}
