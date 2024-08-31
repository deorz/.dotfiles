return {
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		opts = {
			api_host_cmd = "echo -n api.proxyapi.ru/openai",
			api_key_cmd = "echo -n sk-9RhpwIPNgPiMo7NJ37eiav8SVv6e3ovQ",
			openai_params = {
				model = "gpt-4o",
			},
		},
	},
}
