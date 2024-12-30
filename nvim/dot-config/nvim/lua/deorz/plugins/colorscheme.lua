return {
	-- {
	-- 	"catppuccin/nvim",
	-- 	lazy = false,
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- 	opts = {
	-- 		transparent_background = true,
	-- 		integrations = {
	-- 			mason = true,
	-- 			snacks = true,
	-- 			lsp_trouble = true,
	-- 			notifier = true,
	-- 		},
	-- 	},
	-- 	config = function(_, opts)
	-- 		require("catppuccin").setup(opts)
	-- 		vim.cmd.colorscheme("catppuccin")
	-- 	end,
	-- },
	{
		"rose-pine/neovim",
		lazy = false,
		name = "rose-pine",
		priority = 1000,
		opts = {
			variant = "moon",
			styles = {
				transparency = true,
			},
		},
		config = function(_, opts)
			require("rose-pine").setup(opts)
			vim.cmd.colorscheme("rose-pine")
		end,
	},
}
