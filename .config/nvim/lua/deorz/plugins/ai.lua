return {
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		cmd = {
			"AvanteAsk",
			"AvanteToggle",
			"AvanteChat",
		},
		version = false,
		build = "make",
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"echasnovski/mini.icons",
			{
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						use_absolute_path = true,
					},
				},
			},
			"MeanderingProgrammer/render-markdown.nvim",
		},
		opts = function()
			local command = "echo -n $(cat " .. vim.fn.expand("$HOME") .. "/.config/nvim/key.txt)"
			local key = vim.fn.system(command)
			vim.env["OPENAI_API_KEY"] = key
			return {
				provider = "openai",
				auto_suggestions_provider = "openai",
				openai = {
					endpoint = "https://api.proxyapi.ru/openai/v1",
				},
			}
		end,
	},
}
