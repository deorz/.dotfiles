return {
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
      "mfussenegger/nvim-dap-python",
      "miroshQa/debugmaster.nvim",
    },
    config = function()
      vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
      local dap_icons = {
        Stopped = { " ", "DiagnosticWarn", "DapStoppedLine" },
        Breakpoint = " ",
        BreakpointCondition = " ",
        BreakpointRejected = { " ", "DiagnosticError" },
        LogPoint = ".>",
      }
      for name, sign in pairs(dap_icons) do
        sign = type(sign) == "table" and sign or { sign }
        vim.fn.sign_define(
          "Dap" .. name,
          { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
        )
      end
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    lazy = true,
    config = function()
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end,
  },
  {
    "miroshQa/debugmaster.nvim",
    lazy = true,
    -- config = function()
    --   local dm = require("debugmaster")
    --   -- make sure you don't have any other keymaps that starts with "<leader>d" to avoid delay
    --   -- Alternative keybindings to "<leader>d" could be: "<leader>m", "<leader>;"
    --   vim.keymap.set({ "n", "v" }, "<leader>d", dm.mode.toggle, { nowait = true })
    --   -- If you want to disable debug mode in addition to leader+d using the Escape key:
    --   -- vim.keymap.set("n", "<Esc>", dm.mode.disable)
    --   -- This might be unwanted if you already use Esc for ":noh"
    --   vim.keymap.set("t", "<C-/>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
    -- end,
    keys = {
      {
        "<leader>d",
        function()
          require("debugmaster").mode.toggle()
        end,
        mode = { "n", "v" },
        nowait = true,
        desc = "Toggle debug mode",
      },
    },
  },
}
