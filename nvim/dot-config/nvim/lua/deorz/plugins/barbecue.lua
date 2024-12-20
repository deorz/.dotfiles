return {
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"SmiteshP/nvim-navic",
		},
		opts = {
			theme = "catppuccin",
		},
	},
}
