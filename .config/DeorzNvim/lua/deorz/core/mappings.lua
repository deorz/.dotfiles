vim.g.mapleader = " "

local keymap = vim.keymap

-- Buffer cycling
keymap.set("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next Buffer" })
keymap.set("n", "<leader>bp", "<cmd>bprev<cr>", { desc = "Previous Buffer" })
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
keymap.set("n", "<leader>ee", "<cmd>Neotree reveal float<cr>", { desc = "Toggle Neo-tree float window" })

-- Flash
keymap.set({ "n", "x", "o" }, "s", '<cmd>lua require("flash").jump()<cr>', { desc = "Flash" })

-- Which-Key
keymap.set({ "n", "x", "o" }, "<leader>?", function()
	require("which-key").show({ global = false })
end, { desc = "Which-Key Buffer Keymaps" })

-- Lazy Utilities
keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "Open LazyGit" })

-- Search Group (Prefix S)
keymap.set("n", "<leader>sc", "<cmd>nohl<cr>", { desc = "Clear Search Highlights" })
---- FzfLua
keymap.set("n", "<leader>sb", "<cmd>FzfLua buffers<cr>", { desc = "FZF Open Buffers Picker" })
keymap.set("n", "<leader>sf", "<cmd>FzfLua files<cr>", { desc = "FZF Open File Picker" })
keymap.set(
	"n",
	"<leader>s/",
	"<cmd>lua require'fzf-lua'.grep_project({ prompt='Search> '})<cr>",
	{ desc = "FZF Open Find in Files" }
)
keymap.set("n", "<leader>sk", "<cmd>FzfLua keymaps<cr>", { desc = "FZF Open Keymaps List" })
keymap.set("n", "<leader>sr", "<cmd>FzfLua registers<cr>", { desc = "FZF Open Search Registers List" })
keymap.set("n", "<leader>sm", "<cmd>FzfLua manpages<cr>", { desc = "FZF Open Search Manpages" })
keymap.set("n", "<leader>sl", "<cmd>FzfLua grep_curbuf<cr>", { desc = "FZF Open Search In Current Buffer" })

------ FzfLua Git
keymap.set("n", "<leader>sgc", "<cmd>FzfLua git_commits<cr>", { desc = "FZF Open Git Commits" })
keymap.set("n", "<leader>sgf", "<cmd>FzfLua git_files<cr>", { desc = "FZF Open Git Files" })
keymap.set("n", "<leader>sgb", "<cmd>FzfLua git_branches<cr>", { desc = "FZF Open Git Branches" })
------ FzfLua History
keymap.set("n", "<leader>shc", "<cmd>FzfLua command_history<cr>", { desc = "FZF Open Command History" })
keymap.set("n", "<leader>shs", "<cmd>FzfLua search_history<cr>", { desc = "FZF Open Search History" })

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

keymap.set("n", "<leader>cr", function()
	return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true, desc = "Incremental Rename" })

-- Git
