return {
	{
		"echasnovski/mini.clue",
		version = false,
		event = "VeryLazy",
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

					-- `[` and `]` keys
					{ mode = "n", keys = "[" },
					{ mode = "n", keys = "]" },
				},
				clues = {
					{ mode = "n", keys = "<Leader>b", desc = "Buffer" },
					{ mode = "n", keys = "<Leader>c", desc = "Code" },
					{ mode = "n", keys = "<Leader>d", desc = "Debug" },
					{ mode = "n", keys = "<Leader>e", desc = "Explorer" },
					{ mode = "n", keys = "<Leader>g", desc = "Git" },
					{ mode = "n", keys = "<Leader>n", desc = "Notifications" },
					{ mode = "n", keys = "<Leader>s", desc = "Search" },
					{ mode = "n", keys = "<Leader>t", desc = "Terminal" },
					miniclue.gen_clues.builtin_completion(),
					miniclue.gen_clues.g(),
					miniclue.gen_clues.marks(),
					miniclue.gen_clues.registers(),
					miniclue.gen_clues.windows(),
					miniclue.gen_clues.z(),
				},
				window = {
					delay = 300,
					config = {
						width = "auto",
						border = "rounded",
					},
				},
			}
			miniclue.setup(opts)
		end,
	},
	{
		"echasnovski/mini.files",
		version = false,
		dependencies = {
			"echasnovski/mini.icons",
		},
		opts = {
			windows = {
				max_number = 1,
				preview = false,
			},
		},
		keys = {
			{
				"<leader>ee",
				function()
					local buffer_name = vim.api.nvim_buf_get_name(0)
					if
						buffer_name == ""
						or string.match(buffer_name, "Starter")
						or string.match(buffer_name, "term")
					then
						require("mini.files").open(vim.loop.cwd())
					else
						require("mini.files").open(vim.api.nvim_buf_get_name(0))
					end
				end,
				"n",
				noremap = true,
				silent = true,
				desc = "Toggle Mini.Files window",
			},
		},
	},
	{
		"echasnovski/mini.hipatterns",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		version = false,
		opts = {
			highlighters = {
				fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
				todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
			},
		},
	},
	{
		"echasnovski/mini.surround",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		version = false,
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
		"echasnovski/mini.pairs",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		version = false,
		opts = {},
	},
	{
		"echasnovski/mini.icons",
		version = false,
		lazy = false,
		config = function(_, opts)
			local mini_icons = require("mini.icons")
			mini_icons.setup(opts)
			mini_icons.mock_nvim_web_devicons()
			mini_icons.tweak_lsp_kind()
		end,
	},
	{
		"echasnovski/mini.comment",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		version = false,
		opts = {},
	},
	{
		"echasnovski/mini.splitjoin",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		version = false,
		opts = {},
	},
	{
		"echasnovski/mini.diff",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		version = false,
		opts = {},
	},
	{
		"echasnovski/mini.jump",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		version = false,
		opts = {},
	},
	{
		"echasnovski/mini.ai",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		version = false,
		opts = {},
	},
	{
		"echasnovski/mini.bracketed",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		version = false,
		opts = {},
	},
	{
		"echasnovski/mini.jump2d",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		version = false,
		opts = {},
	},
}
