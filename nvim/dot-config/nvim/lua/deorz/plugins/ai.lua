return {
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			strategies = {
				chat = {
					adapter = "openai_compatible",
					slash_commands = {
						["file"] = {
							callback = "strategies.chat.slash_commands.file",
							description = "Select a file using Snacks",
							opts = {
								provider = "snacks",
								contains_code = true,
							},
						},
					},
				},
				inline = {
					adapter = "openai_compatible",
				},
			},
			display = {
				chat = {
					auto_scroll = true,
					show_settings = true,
				},
			},
			adapters = {
				openai_compatible = function()
					local command = "echo -n $(cat " .. vim.fn.expand("$HOME") .. "/.config/nvim/key.txt)"
					local key = vim.fn.system(command)
					vim.env["OPENAI_COMPATIBLE_API_KEY"] = key
					return require("codecompanion.adapters").extend("openai_compatible", {
						env = {
							api_key = "OPENAI_COMPATIBLE_API_KEY",
							url = "https://api.proxyapi.ru/openai",
						},
						schema = {
							model = {
								default = "gpt-4o",
								choises = { "gpt-4o", "gpt-4o-mini" },
							},
						},
					})
				end,
			},
		},
		keys = {
			{
				"<leader>aa",
				"<cmd>CodeCompanionActions<cr>",
				"n",
				noremap = true,
				silent = true,
				desc = "AI Actions",
			},
		},
	},
	-- {
	-- 	"yetone/avante.nvim",
	-- 	event = "VeryLazy",
	-- 	cmd = {
	-- 		"AvanteAsk",
	-- 		"AvanteToggle",
	-- 		"AvanteChat",
	-- 	},
	-- 	version = false,
	-- 	build = "make",
	-- 	dependencies = {
	-- 		"stevearc/dressing.nvim",
	-- 		"nvim-lua/plenary.nvim",
	-- 		"MunifTanjim/nui.nvim",
	-- 		"echasnovski/mini.icons",
	-- 		{
	-- 			"HakonHarnes/img-clip.nvim",
	-- 			event = "VeryLazy",
	-- 			opts = {
	-- 				default = {
	-- 					embed_image_as_base64 = false,
	-- 					prompt_for_file_name = false,
	-- 					drag_and_drop = {
	-- 						insert_mode = true,
	-- 					},
	-- 					use_absolute_path = true,
	-- 				},
	-- 			},
	-- 		},
	-- 		"MeanderingProgrammer/render-markdown.nvim",
	-- 	},
	-- 	opts = function()
	-- 		local command = "echo -n $(cat " .. vim.fn.expand("$HOME") .. "/.config/nvim/key.txt)"
	-- 		local key = vim.fn.system(command)
	-- 		vim.env["OPENAI_API_KEY"] = key
	-- 		return {
	-- 			provider = "openai",
	-- 			auto_suggestions_provider = "openai",
	-- 			openai = {
	-- 				endpoint = "https://api.proxyapi.ru/openai/v1",
	-- 			},
	-- 		}
	-- 	end,
	-- },
}
