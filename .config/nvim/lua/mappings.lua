
map = vim.keymap

vim.g.mapleader = " "

map.set("i", "jk", "<ESC>", { desc = "Exit Insert Mode" })
map.set("n", "<leader>sf", "<cmd>Pick files<cr>", { desc = "Pick Files" })
map.set("n", "<leader>s/", "<cmd>Pick grep_live<cr>", { desc = "Find in Files" })
