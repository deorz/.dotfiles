return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		opts = function()
			return {
				flavour = "mocha",
				transparent_background = true,
				integrations = {
					gitsigns = true,
					diffview = true,
					fzf = true,
					mason = true,
					neotest = true,
					noice = true,
				},
			}
		end,
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
