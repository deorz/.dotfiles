return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = {},
	},
	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 2000,
			render = "wrapped-compact",
			background_colour = "#000000",
		},
	},
}
