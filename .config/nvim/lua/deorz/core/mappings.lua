vim.g.mapleader = " "

local keymap = vim.keymap

-- Buffer cycling
keymap.set("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
keymap.set("n", "<S-Tab>", "<cmd>bprev<cr>", { desc = "Previous Buffer" })
keymap.set("n", "<leader>bx", "<cmd>bd<cr>", { desc = "Delete Buffer" })

-- Better Indent
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Exit insert mode
keymap.set({ "i" }, "jk", "<Esc>", { desc = "Exit From Insert Mode" })

-- Utilities Group (Prefix U)
keymap.set("n", "<leader>ul", "<cmd>Lazy<cr>", { desc = "Lazy" })
keymap.set("n", "<leader>um", "<cmd>Mason<cr>", { desc = "Mason" })
keymap.set("n", "<leader>ud", "<cmd>DBUIToggle<cr>", { desc = "Toggle DBUI" })

-- Explorer
keymap.set("n", "<leader>ee", "<cmd>lua MiniFiles.open()<cr>", { desc = "Toggle Mini.Files window" })

-- Lazy Utilities
keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "Open LazyGit" })

-- Flash
keymap.set("n", "s", "<cmd>lua require('flash').jump()<cr>", { desc = "Flash" })

-- Search Group (Prefix S)
keymap.set("n", "<leader>sc", "<cmd>nohl<cr>", { desc = "Clear Search Highlights" })
---- Telescope
keymap.set(
	"n",
	"<leader>sb",
	"<cmd>lua require('telescope.builtin').buffers({ ignore_current_buffer = true, sort_lastused = true, sort_mru = true })<cr>",
	{ desc = "Open Buffers Picker" }
)
keymap.set(
	"n",
	"<leader>sf",
	"<cmd>lua require('telescope.builtin').find_files({ hidden = true })<cr>",
	{ desc = "Open File Picker" }
)
keymap.set("n", "<leader>s/", "<cmd>Telescope live_grep<cr>", { desc = "Open Find in Files" })
keymap.set("v", "<leader>s/", "<cmd>Telescope grep_string<cr>", { desc = "Open Find Selected Text" })
keymap.set("n", "<leader>sl", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Open Find In Current Buffer" })

-- Git
keymap.set("n", "<leader>go", "<cmd>lua MiniDiff.toggle_overlay()<cr>", { desc = "Toggle Git Overlay" })

-- Code Linting & Formating
---- Conform
keymap.set({ "n", "v" }, "<leader>cf", function()
	require("conform").format({ lsp_format = "fallback", async = false, timeout_ms = 500 })
end, { desc = "Format file" })

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "python" },
	callback = function()
		keymap.set("n", "<leader>cv", "<cmd>VenvSelect<cr>", { desc = "Open Python Venv Picker" })
	end,
})
