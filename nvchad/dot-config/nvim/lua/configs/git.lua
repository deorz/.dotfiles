local M = require("nvchad.configs.gitsigns")

M.current_line_blame = true

M.on_attach = function(bufnr)
  local gitsigns = require("gitsigns")

  local function map(mode, l, r, opts)
    opts = opts or {}
    opts.buffer = bufnr
    vim.keymap.set(mode, l, r, opts)
  end

  -- Navigation
  map("n", "]h", function()
    gitsigns.nav_hunk("next")
  end, { desc = "Next Hunk" })

  map("n", "[h", function()
    gitsigns.nav_hunk("prev")
  end, { desc = "Prev Hunk" })

  -- Actions
  map("n", "gh_", gitsigns.reset_hunk, { desc = "Reset Hunk" })

  map("v", "gh_", function()
    gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
  end, { desc = "Reset Hunk" })

  map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Preview Hunk" })
  map("n", "<leader>gi", gitsigns.preview_hunk_inline, { desc = "Preview Hunk Inline" })

  map("n", "<leader>gb", function()
    gitsigns.blame_line({ full = true })
  end, { desc = "Blame Line" })

  map("n", "<leader>gd", gitsigns.diffthis, { desc = "Diff" })

  map("n", "<leader>gD", function()
    gitsigns.diffthis("~")
  end, { desc = "Diff" })

  map("n", "<leader>gQ", function()
    gitsigns.setqflist("all")
  end, { desc = "Qflist from hunks" })
  map("n", "<leader>gq", gitsigns.setqflist, { desc = "Qflist from hunks" })

  -- Toggles
  map("n", "<leader>ub", gitsigns.toggle_current_line_blame, { desc = "Toggle current line blame" })
  map("n", "<leader>uw", gitsigns.toggle_word_diff, { desc = "Toggle word diff" })

  -- Text object
  map({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "Inside Hunk" })
end

return M
