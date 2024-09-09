return {
	{
		"deorz/venv-selector.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"deorz/mini.pick",
			"mfussenegger/nvim-dap",
			"mfussenegger/nvim-dap-python",
		},
		event = "VeryLazy",
		branch = "regexp",
		opts = {
			settings = {
				options = {
					notify_user_on_venv_activation = true,
				},
			},
		},
	},
}
