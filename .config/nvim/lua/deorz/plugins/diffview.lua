return {
	{
		"sindrets/diffview.nvim",
		cmd = {
			"DiffviewOpen",
			"DiffviewClose",
		},
		opts = {},
		keys = {
			{
				"<leader>gd",
				function()
					if next(require("diffview.lib").views) == nil then
						-- BRANCH = ""
						-- local mini_pick = require("mini.pick")
						-- if vim.fn.executable("git") ~= 1 then
						-- 	return
						-- end
						-- local ex_diff_open = function(item)
						-- 	local branch = item:match("^%*?%s*(%S+)")
						-- 	vim.notify(branch)
						-- 	BRANCH = branch
						-- end
						-- local opts = {
						-- 	source = {
						-- 		name = "Open DiffView Branch",
						-- 		cwd = vim.fn.getcwd(),
						-- 		choose = ex_diff_open,
						-- 	},
						-- }
						-- local command = {
						-- 	"git",
						-- 	"branch",
						-- 	"-v",
						-- 	"--no-color",
						-- 	"--list",
						-- 	"--all",
						-- }
						-- mini_pick.builtin.cli({ command = command }, opts)
						-- vim.cmd("DiffviewOpen " .. BRANCH)
						vim.cmd("DiffviewOpen")
					else
						vim.cmd("set hidden")
						vim.cmd("DiffviewClose")
						vim.cmd("set nohidden")
					end
				end,
				"n",
				noremap = true,
				silent = true,
				desc = "Toggle DiffView",
			},
		},
	},
}
