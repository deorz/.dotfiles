return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			bigfile = { enabled = false },
			dashboard = { enabled = true },
			notifier = {
				enabled = true,
				timeout = 3000,
			},
			picker = {
				formatters = {
					file = {
						truncate = 80,
					},
				},
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
				"<leader>bx",
				function()
					require("snacks").bufdelete()
				end,
				desc = "Delete Buffer",
			},
			{
				"<leader>gg",
				function()
					require("snacks").lazygit()
				end,
				desc = "Lazygit",
			},

			{
				"<leader>sf",
				function()
					require("snacks").picker.files({ hidden = true })
				end,
				desc = "Open File Picker",
			},
			{
				"<leader>sb",
				function()
					require("snacks").picker.buffers({ current = false })
				end,
				desc = "Open Buffer Picker",
			},
			{
				"<leader>s/",
				function()
					require("snacks").picker.grep()
				end,
				desc = "Open Find in Files Picker",
			},
			{
				"<leader>s/",
				function()
					require("snacks").picker.grep_word()
				end,
				mode = "v",
				desc = "Grep Visual",
			},
			{
				"<leader>sl",
				function()
					require("snacks").picker.lines()
				end,
				desc = "Search Lines",
			},
		},
		init = function()
			local Snacks = require("snacks")
			vim.ui.select = Snacks.picker.select
			Snacks.input.enable()
			Snacks.scroll.enable()
		end,
	},
}
