return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				transparent_background = true,
				integrations = {
					diffview = true,
					mason = true,
					notify = true,
					noice = true,
					which_key = true,
					gitsigns = true,
					nvim_surround = true,
					indent_blankline = {
						enabled = true,
						scope_color = "peach",
						colored_indent_levels = true,
					},
					mini = {
						enabled = true,
					},
					colorful_winsep = {
						enabled = true,
						color = "peach",
					},
				},
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
