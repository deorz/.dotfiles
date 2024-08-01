return {
	{
		"stevearc/dressing.nvim",
		opts = {
			select = {
				backend = { "fzf_lua", "fzf", "telescope", "builtin", "nui" },
				fzf_lua = {
					winopts = {
						height = 0.5,
						width = 0.5,
					},
				},
			},
		},
	},
}
