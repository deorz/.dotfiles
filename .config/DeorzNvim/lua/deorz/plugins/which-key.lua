return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			icons = {
				mappings = false,
			},
			spec = {
				mode = { "n", "v" },
				{ "<leader>s", group = "Search", icon = "" },
				{ "<leader>c", group = "Code", icon = "" },
				{ "<leader>e", group = "Explore", icon = "" },
				{ "<leader>g", group = "Git", icon = "" },
				{ "<leader>sg", group = "Search Git", icon = "" },
				{ "<leader>sh", group = "Search Histories", "" },
				{ "<leader>u", group = "Utilities", icon = "" },
				{ "<leader>l", group = "Lazy Utilities", icon = "" },
			},
		},
	},
}
