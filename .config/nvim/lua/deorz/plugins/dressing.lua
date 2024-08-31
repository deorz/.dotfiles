return {
	{
		"stevearc/dressing.nvim",
		opts = {
			select = {
				backend = { "telescope", "builtin", "nui" },
				telescope = require("telescope.themes").get_dropdown(),
			},
		},
	},
}
