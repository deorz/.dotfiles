return {
	{
		"echasnovski/mini.files",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			windows = {
				preview = true,
				width_preview = 100,
			},
		},
	},
	{
		"echasnovski/mini.indentscope",
		version = "*",
		opts = {
			symbol = "│",
		},
	},
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		version = false,
		opts = {},
	},
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		version = false,
		opts = {
			skip_ts = { "string" },
			markdown = true,
		},
	},
	{
		"echasnovski/mini.ai",
		event = "VeryLazy",
		opts = {},
	},
	{
		"echasnovski/mini.surround",
		version = "*",
		opts = {
			mappings = {
				add = "ysa",
				delete = "ysd",
				find = "ysf",
				find_left = "ysF",
				highlight = "ysh",
				replace = "ysr",
				update_n_lines = "ysn",
			},
		},
	},
	{
		"echasnovski/mini.clue",
		version = "*",
		config = function()
			local miniclue = require("mini.clue")
			local opts = {
				triggers = {
					-- Leader triggers
					{ mode = "n", keys = "<leader>" },
					{ mode = "x", keys = "<leader>" },

					-- Built-in completion
					{ mode = "i", keys = "<C-x>" },

					-- `g` key
					{ mode = "n", keys = "g" },
					{ mode = "x", keys = "g" },

					-- Marks
					{ mode = "n", keys = "'" },
					{ mode = "n", keys = "`" },
					{ mode = "x", keys = "'" },
					{ mode = "x", keys = "`" },

					-- Registers
					{ mode = "n", keys = '"' },
					{ mode = "x", keys = '"' },
					{ mode = "i", keys = "<C-r>" },
					{ mode = "c", keys = "<C-r>" },

					-- Window commands
					{ mode = "n", keys = "<C-w>" },

					-- `z` key
					{ mode = "n", keys = "z" },
					{ mode = "x", keys = "z" },
				},
				clues = {
					miniclue.gen_clues.builtin_completion(),
					miniclue.gen_clues.g(),
					miniclue.gen_clues.marks(),
					miniclue.gen_clues.registers(),
					miniclue.gen_clues.windows(),
					miniclue.gen_clues.z(),
				},
				window = {
					delay = 500,
				},
			}

			miniclue.setup(opts)
		end,
	},
	{
		"echasnovski/mini.tabline",
		version = "*",
		opts = {},
	},
	{
		"echasnovski/mini.statusline",
		version = "*",
		config = function()
			local check_macro_recording = function()
				if vim.fn.reg_recording() ~= "" then
					return "Recording @" .. vim.fn.reg_recording()
				else
					return ""
				end
			end

			local get_file_icon = function()
				local filetype = vim.bo.filetype
				if filetype == "" or vim.bo.buftype ~= "" then
					return ""
				end

				local fileicon = require("nvim-web-devicons").get_icon(vim.fn.expand("%:t"), nil, { default = true })
				return string.format("%s", fileicon)
			end

			local get_file_info = function()
				local filetype = vim.bo.filetype

				if filetype == "" or vim.bo.buftype ~= "" then
					return ""
				end

				-- Add filetype icon
				filetype = get_file_icon() .. " " .. filetype

				local encoding = vim.bo.fileencoding or vim.bo.encoding
				return string.format("%s %s", filetype, encoding)
			end

			local get_file_name = function()
				if vim.bo.buftype == "terminal" then
					return "%t"
				else
					return "%f%m%r"
				end
			end

			local diff_icon = require("nvim-web-devicons").get_icon("Diff")

			require("mini.statusline").setup({
				content = {
					active = function()
						local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
						local git = MiniStatusline.section_diff({
							trunc_width = 40,
							icon = diff_icon,
						})
						local diagnostics = MiniStatusline.section_diagnostics({
							trunc_width = 75,
							signs = {
								ERROR = " ",
								WARN = " ",
								INFO = " ",
								HINT = " ",
							},
						})
						local fileicon = get_file_icon()
						local filename = get_file_name()
						local fileinfo = get_file_info()
						local macro = check_macro_recording()

						return MiniStatusline.combine_groups({
							{ hl = mode_hl, strings = { mode } },
							{ hl = "MiniStatuslineDevinfo", strings = { git, diagnostics } },
							{ hl = "MiniStatuslineFilename", strings = { filename, fileicon } },
							"%=",
							{ hl = "MiniStatuslineFilename", strings = { macro } },
							{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
							{ hl = mode, strings = { "%l:%L" } },
						})
					end,
				},
			})
		end,
	},
	{
		"echasnovski/mini.diff",
		version = "*",
		opts = {},
	},
}
