vim.g.mapleader = " "

local keymap = vim.keymap

-- ╔═══════════════════════╗
-- ║    General Keymaps    ║
-- ╚═══════════════════════╝
keymap.set("i", "jk", "<Esc>", { desc = "Exit From Insert Mode" })

-- Indentation
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- ╔════════════════════╗
-- ║   Search Keymaps   ║
-- ╚════════════════════╝
keymap.set("n", "<leader>sc", "<cmd>nohlsearch<cr>", { noremap = true, silent = true, desc = "Clear Search Highlight" })
