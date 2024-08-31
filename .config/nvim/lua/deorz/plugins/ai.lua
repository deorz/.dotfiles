return {
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		opts = function()
			local home = vim.fn.expand("$HOME")
			return {
				api_host_cmd = "echo -n api.proxyapi.ru/openai",
				api_key_cmd = "cat " .. home .. "/.config/nvim/key.txt",
				openai_params = {
					model = "gpt-4o",
				},
			}
		end,
	},
}
