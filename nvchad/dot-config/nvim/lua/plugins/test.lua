return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-python",
		},
		opts = function()
			return {
				adapters = {
					require("neotest-python"),
				},
			}
		end,
		keys = {
			{
				"<leader>tc",
				function()
					require("neotest").run.run(vim.fn.expand("%"))
				end,
				desc = "Run tests in current file",
			},
			{
				"<leader>ta",
				function()
					require("neotest").run.run(vim.uv.cwd())
				end,
				desc = "Run all tests",
			},
			{
				"<leader>tr",
				function()
					require("neotest").run.run()
				end,
				desc = "Run nearest test",
			},
			{
				"<leader>tt",
				function()
					require("neotest").run.stop()
				end,
				desc = "Terminate running tests",
			},
			{
				"<leader>td",
				function()
					require("neotest").run.run({ strategy = "dap" })
				end,
				desc = "Debug nearest test",
			},
			{
				"<leader>to",
				function()
					require("neotest").output_panel.toggle()
				end,
				desc = "Toggle output panel",
			},
			{
				"<leader>ts",
				function()
					require("neotest").summary.toggle()
				end,
				desc = "Toggle summary",
			},
		},
	},
}

