local map = vim.keymap.set

map("i", "jk", "<Esc>", { desc = "Exit From Insert Mode" })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "Clear highlights" })

map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "<leader>un", "<cmd>set wrap!<CR>", { desc = "Toggle line wrap" })
