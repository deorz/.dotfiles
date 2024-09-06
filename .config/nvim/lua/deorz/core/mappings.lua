vim.g.mapleader = " "

local keymap = vim.keymap

-- ╔═══════════════════════╗
-- ║    General Keymaps    ║
-- ╚═══════════════════════╝
keymap.set("i", "jk", "<Esc>", { desc = "Exit From Insert Mode" })

-- Buffer
keymap.set("n", "<TAB>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
keymap.set("n", "<S-TAB>", "<cmd>bprev<cr>", { desc = "Previous Buffer" })
keymap.set("n", "<leader>bx", "<cmd>bd<cr>", { desc = "Delete Buffer" })
keymap.set("n", "<leader>bw", "<cmd>%bd|e#<cr>", { desc = "Close Other Buffers" })

-- Indentation
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Flash
-- keymap.set("n", "s", "<cmd>lua require('flash').jump()<cr>", { desc = "Flash" })

-- ╔════════════════════╗
-- ║  Explorer Keymaps  ║
-- ╚════════════════════╝
keymap.set("n", "<leader>ee", function()
	local buffer_name = vim.api.nvim_buf_get_name(0)
	if buffer_name == "" or string.match(buffer_name, "Starter") then
		require("mini.files").open(vim.loop.cwd())
	else
		require("mini.files").open(vim.api.nvim_buf_get_name(0))
	end
end, { desc = "Toggle Mini.Files window" })

-- ╔════════════════════╗
-- ║   Search Keymaps   ║
-- ╚════════════════════╝
keymap.set("n", "<leader>sc", "<cmd>nohlsearch<cr>", { noremap = true, silent = true, desc = "Clear Search Highlight" })
keymap.set("n", "<leader>sf", function()
	require("mini.pick").registry.files()
end, { noremap = true, silent = true, desc = "Open File Picker" })
keymap.set("n", "<leader>sr", function()
	require("mini.pick").builtin.resume()
end, { noremap = true, silent = true, desc = "Resume Picker" })
keymap.set("n", "<leader>sb", function()
	require("mini.pick").builtin.buffers({ include_current = false })
end, { noremap = true, silent = true, desc = "Open Buffer Picker" })
keymap.set("n", "<leader>s/", function()
	require("mini.pick").builtin.grep_live()
end, { noremap = true, silent = true, desc = "Open Find in Files Picker" })
keymap.set("n", "<leader>sl", function()
	require("mini.extra").pickers.buf_lines({ scope = "current" })
end, { nowait = true, desc = "Search Lines" })

-- ╔═══════════════════╗
-- ║    Git Keymaps    ║
-- ╚═══════════════════╝
keymap.set("n", "<leader>go", "<cmd>lua MiniDiff.toggle_overlay()<cr>", { desc = "Toggle [G]it [O]verlay" })
keymap.set("n", "<leader>gd", function()
	if next(require("diffview.lib").views) == nil then
		vim.cmd("DiffviewOpen")
	else
		vim.cmd("set hidden")
		vim.cmd("DiffviewClose")
		vim.cmd("set nohidden")
	end
end, { desc = "Toggle [G]it [D]iff View" })

-- ╔═══════════════════╗
-- ║    LSP Keymaps    ║
-- ╚═══════════════════╝
keymap.set({ "n", "v" }, "<leader>cf", function()
	require("conform").format({ lsp_format = "fallback", async = false, timeout_ms = 500 })
end, { desc = "Format file" })

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "python" },
	callback = function()
		keymap.set("n", "<leader>cv", "<cmd>VenvSelect<cr>", { desc = "Open Python Venv Picker" })
	end,
})

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
