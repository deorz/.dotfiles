return {
	{
		"echasnovski/mini.clue",
		version = false,
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
					{ mode = "n", keys = "<Leader>e", desc = "Explorer" },
					{ mode = "n", keys = "<Leader>s", desc = "Search" },
					{ mode = "n", keys = "<Leader>d", desc = "Debug" },
					{ mode = "n", keys = "<Leader>l", desc = "Lazy" },
					{ mode = "n", keys = "<Leader>g", desc = "Git" },
					{ mode = "n", keys = "<Leader>c", desc = "Code" },
					{ mode = "n", keys = "<Leader>t", desc = "Tests" },
					{ mode = "n", keys = "<Leader>u", desc = "Utilities" },
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
		"echasnovski/mini.basics",
		version = false,
		opts = {
			options = {
				basic = false,
				win_borders = "bold",
			},
			mappings = {
				basic = false,
				windows = true,
			},
			autocommands = {
				relnum_in_visual_mode = true,
			},
		},
	},
	{
		"echasnovski/mini.starter",
		version = false,
		opts = function()
			local starter = require("mini.starter")
			return {
				autoopen = true,
				header = function()
					return table.concat({
						[[                                  __]],
						[[     ___     ___    ___   __  __ /\_\    ___ ___]],
						[[    / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\]],
						[[   /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \]],
						[[   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
						[[    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
					}, "\n")
				end,
				items = {
					starter.sections.pick(),
					starter.sections.recent_files(5, true, true),
				},
				content_hooks = {
					starter.gen_hook.adding_bullet(),
					starter.gen_hook.aligning("center", "center"),
				},
				footer = "",
			}
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
				preview = true,
				width_preview = 100,
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
		"echasnovski/mini.indentscope",
		version = false,
		opts = {
			symbol = "│",
		},
	},
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		version = false,
		opts = {},
	},
	{
		"echasnovski/mini.ai",
		event = "VeryLazy",
		opts = function()
			local ai = require("mini.ai")
			return {
				n_lines = 500,
				custom_textobjects = {
					o = ai.gen_spec.treesitter({
						a = { "@block.outer", "@conditional.outer", "@loop.outer" },
						i = { "@block.inner", "@conditional.inner", "@loop.inner" },
					}, {}),
					f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
					c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
				},
			}
		end,
	},
	{
		"echasnovski/mini.jump2d",
		version = false,
		opts = {
			labels = "abcdefghijklnqrstuvwy",
			allowed_lines = {
				blank = false,
			},
			mappings = {
				start_jumping = "s",
			},
		},
	},
	{
		"echasnovski/mini.jump",
		version = false,
		opts = {
			delay = {
				idle_stop = 2000,
			},
		},
	},
	{
		"echasnovski/mini.icons",
		version = false,
		opts = {},
		config = function(_, opts)
			local mini_icons = require("mini.icons")
			mini_icons.setup(opts)
			mini_icons.mock_nvim_web_devicons()
		end,
	},
	{
		"echasnovski/mini.bufremove",
		version = false,
		opts = {},
		keys = {
			{
				"<leader>bx",
				function()
					require("mini.bufremove").wipeout()
				end,
				"n",
				noremap = true,
				silent = true,
				desc = "Delete Buffer",
			},
			{
				"<leader>bw",
				"<cmd>%bd|e#<cr>",
				"n",
				noremap = true,
				silent = true,
				desc = "Close Other Buffers",
			},
		},
	},
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		version = false,
		opts = {},
	},
	{
		"echasnovski/mini.bracketed",
		version = false,
		opts = {},
	},
	{
		"echasnovski/mini.cursorword",
		version = false,
		opts = {},
	},
	{
		"echasnovski/mini.splitjoin",
		version = false,
		opts = {},
	},
	{
		"echasnovski/mini.diff",
		version = false,
		opts = {},
	},
}
