vim.g.mapleader = " "

local keymap = vim.keymap

-- ╔═══════════════════════╗
-- ║    General Keymaps    ║
-- ╚═══════════════════════╝
keymap.set("i", "jk", "<Esc>", { desc = "Exit From Insert Mode" })

vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "term://*",
	callback = function()
		if vim.bo.filetype ~= "lazygit" then
			keymap.set("t", "jk", [[<C-\><C-n>]], { desc = "Exit From Terminal Mode" })
		end
	end,
})

-- Buffer
keymap.set("n", "<TAB>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
keymap.set("n", "<S-TAB>", "<cmd>bprev<cr>", { desc = "Previous Buffer" })

-- Indentation
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Splits
keymap.set("n", "<C-h>", function()
	require("smart-splits").move_cursor_left()
end)
keymap.set("n", "<C-j>", function()
	require("smart-splits").move_cursor_down()
end)
keymap.set("n", "<C-k>", function()
	require("smart-splits").move_cursor_up()
end)
keymap.set("n", "<C-l>", function()
	require("smart-splits").move_cursor_right()
end)

keymap.set("n", "<C-Left>", function()
	require("smart-splits").resize_left()
end)
keymap.set("n", "<C-Down>", function()
	require("smart-splits").resize_down()
end)
keymap.set("n", "<C-Up>", function()
	require("smart-splits").resize_up()
end)
keymap.set("n", "<C-Right>", function()
	require("smart-splits").resize_right()
end)

-- ╔════════════════════╗
-- ║   Search Keymaps   ║
-- ╚════════════════════╝
keymap.set("n", "<leader>sc", "<cmd>nohlsearch<cr>", { noremap = true, silent = true, desc = "Clear Search Highlight" })

-- ╔═══════════════════╗
-- ║    LSP Keymaps    ║
-- ╚═══════════════════╝
keymap.set({ "n", "v" }, "<leader>cf", function()
	require("conform").format({ lsp_format = "fallback", async = true })
end, { desc = "Format file" })

keymap.set("n", "<leader>cx", function()
	vim.cmd("TSBufDisable autotag")
	vim.cmd("TSBufDisable highlight")
	vim.cmd("TSBufDisable incremental_selection")
	vim.cmd("TSBufDisable indent")
	vim.cmd("TSBufDisable playground")
	vim.cmd("TSBufDisable query_linter")
	vim.cmd("TSBufDisable rainbow")
	vim.cmd("TSBufDisable refactor.highlight_definitions")
	vim.cmd("TSBufDisable refactor.navigation")
	vim.cmd("TSBufDisable refactor.smart_rename")
	vim.cmd("TSBufDisable refactor.highlight_current_scope")
	vim.cmd("TSBufDisable textobjects.swap")
	vim.cmd("TSBufDisable textobjects.lsp_interop")
	vim.cmd("TSBufDisable textobjects.select")
	vim.cmd("LspStop")
end, { noremap = true, silent = true, desc = "Disable code features (LSP, Treesitter)" })

keymap.set("n", "<leader>cz", function()
	vim.cmd("LspStop")
	vim.cmd("LspStart")
end, { noremap = true, silent = true, desc = "Restart LSP" })

-- ╔══════════════════════╗
-- ║    Tests Keymaps     ║
-- ╚══════════════════════╝
keymap.set("n", "<leader>tt", function()
	require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "Run File" })
keymap.set("n", "<leader>tT", function()
	require("neotest").run.run(vim.uv.cwd())
end, { desc = "Run All Test Files" })
keymap.set("n", "<leader>tr", function()
	require("neotest").run.run()
end, { desc = "Run Nearest" })
keymap.set("n", "<leader>tl", function()
	require("neotest").run.run_last()
end, { desc = "Run Last" })
keymap.set("n", "<leader>ts", function()
	require("neotest").summary.toggle()
end, { desc = "Toggle Summary" })
keymap.set("n", "<leader>to", function()
	require("neotest").output.open({ enter = true, auto_close = true })
end, { desc = "Show Output" })
keymap.set("n", "<leader>tO", function()
	require("neotest").output_panel.toggle()
end, { desc = "Toggle Output Panel" })
keymap.set("n", "<leader>tS", function()
	require("neotest").run.stop()
end, { desc = "Stop" })
keymap.set("n", "<leader>tw", function()
	require("neotest").watch.toggle(vim.fn.expand("%"))
end, { desc = "Toggle Watch" })
keymap.set("n", "<leader>td", function()
	require("neotest").run.run({ strategy = "dap" })
end, { desc = "Debug Nearest" })

-- ╔══════════════════════╗
-- ║  Utilities Keymaps   ║
-- ╚══════════════════════╝
keymap.set("n", "<leader>ul", "<cmd>Lazy<cr>", { desc = "Lazy" })
keymap.set("n", "<leader>um", "<cmd>Mason<cr>", { desc = "Mason" })
keymap.set("n", "<leader>ud", "<cmd>DBUIToggle<cr>", { desc = "Toggle DBUI" })

keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "Open LazyGit" })
