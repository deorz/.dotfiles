return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			bigfile = { enabled = true },
			dashboard = { enabled = true },
			notifier = {
				enabled = true,
				timeout = 3000,
			},
			statuscolumn = { enabled = false },
			styles = {
				notification = {
					wo = { wrap = true },
				},
			},
		},
		keys = {
			{
				"<leader>bs",
				function()
					require("snacks").scratch()
				end,
				desc = "Toggle Scratch Buffer",
			},
			{
				"<leader>bS",
				function()
					require("snacks").scratch.select()
				end,
				desc = "Select Scratch Buffer",
			},
			{
				"<leader>bx",
				function()
					require("snacks").bufdelete()
				end,
				desc = "Delete Buffer",
			},
			{
				"<leader>cR",
				function()
					require("snacks").rename.rename_file()
				end,
				desc = "Rename File",
			},
			{
				"<leader>gB",
				function()
					require("snacks").gitbrowse()
				end,
				desc = "Git Browse",
			},
			{
				"<leader>gb",
				function()
					require("snacks").git.blame_line()
				end,
				desc = "Git Blame Line",
			},
			{
				"<leader>gf",
				function()
					require("snacks").lazygit.log_file()
				end,
				desc = "Lazygit Current File History",
			},
			{
				"<leader>gg",
				function()
					require("snacks").lazygit()
				end,
				desc = "Lazygit",
			},
			{
				"<leader>gl",
				function()
					require("snacks").lazygit.log()
				end,
				desc = "Lazygit Log (cwd)",
			},
			{
				"<leader>nx",
				function()
					require("snacks").notifier.hide()
				end,
				desc = "Dismiss All Notifications",
			},
			{
				"<leader>ns",
				function()
					require("snacks").notifier.show_history()
				end,
				desc = "Notification History",
			},
		},
		init = function()
			local Snacks = require("snacks")
			vim.api.nvim_create_autocmd("User", {
				pattern = "VeryLazy",
				callback = function()
					-- Setup some globals for debugging (lazy-loaded)
					_G.dd = function(...)
						Snacks.debug.inspect(...)
					end
					_G.bt = function()
						Snacks.debug.backtrace()
					end
					vim.print = _G.dd -- Override print to use snacks for `:=` command
				end,
			})
		end,
	},
}
