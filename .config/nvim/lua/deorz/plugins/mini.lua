return {
	{
		"deorz/mini.pick",
		version = false,
		opts = {
			mappings = {
				choose_marked = "<C-q>",
				move_start = nil,
			},
			window = {
				config = {
					border = "rounded",
				},
			},
		},
		config = function(_, opts)
			local mini_pick = require("mini.pick")
			mini_pick.setup(opts)

			vim.ui.select = mini_pick.ui_select

			local pick_hidden = function()
				local items = vim.schedule_wrap(function()
					local command = { "rg", "--files", "--no-follow", "--color=never", "--hidden", "--no-ignore" }
					mini_pick.set_picker_items_from_cli(command, {
						command = command,
						postprocess = nil,
						spawn_opts = {
							cwd = (mini_pick.get_picker_opts() or {}).cwd,
						},
					})
				end)()

				mini_pick.set_picker_opts({
					source = {
						name = "Find Hidden Files",
						items = items,
					},
				})
			end

			mini_pick.registry.files = function()
				local command = { "rg", "--files", "--no-follow", "--color=never", "--hidden" }
				local opts = {
					source = {
						name = "Find Files",
						show = function(buf_id, items, query)
							mini_pick.default_show(buf_id, items, query, { show_icons = true })
						end,
					},
					mappings = { show_hidden = { char = "<C-g>", func = pick_hidden } },
				}
				return mini_pick.builtin.cli({ command = command }, opts)
			end
		end,
	},
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
		"echasnovski/mini.tabline",
		version = false,
		opts = {},
	},
	{
		"echasnovski/mini.statusline",
		version = false,
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

			require("mini.statusline").setup({
				content = {
					active = function()
						local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
						local diagnostics = MiniStatusline.section_diagnostics({
							icon = "",
							trunc_width = 75,
							signs = {
								ERROR = " ",
								WARN = " ",
								INFO = " ",
								HINT = " ",
							},
						})

						if diagnostics ~= "" then
							diagnostics = diagnostics .. " |"
						end

						local branch = MiniStatusline.section_git({
							icon = require("nvim-web-devicons").get_icon("Git", nil, { default = true }),
							trunc_width = 40,
						})
						local fileicon = get_file_icon()
						local filename = get_file_name()
						local fileinfo = get_file_info()
						local macro = check_macro_recording()

						return MiniStatusline.combine_groups({
							{ hl = mode_hl, strings = { mode } },
							{ hl = "MiniStatuslineDevinfo", strings = { branch } },
							{ hl = "MiniStatuslineFilename", strings = { filename, fileicon } },
							"%=",
							{ hl = "MiniStatuslineFileinfo", strings = { macro } },
							{ hl = "MiniStatuslineFileinfo", strings = { diagnostics, fileinfo } },
							{ hl = mode, strings = { "%l:%L" } },
						})
					end,
				},
			})
		end,
	},
	{
		"echasnovski/mini.basics",
		version = false,
		opts = {
			options = {
				basic = false,
				win_borders = "dot",
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
			local lazy_stats = function()
				local stats = require("lazy").stats()
				return "Loaded plugins " .. stats.loaded .. " of " .. stats.count .. "."
			end

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
				footer = lazy_stats(),
			}
		end,
	},
	{
		"echasnovski/mini.files",
		version = false,
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
		"echasnovski/mini-git",
		version = false,
		main = "mini.git",
		opts = {},
		config = function(_, opts)
			require("mini.git").setup(opts)

			-- Use only HEAD name as summary string
			local format_summary = function(data)
				local summary = vim.b[data.buf].minigit_summary
				vim.b[data.buf].minigit_summary_string = summary.head_name or ""
			end

			local au_opts = { pattern = "MiniGitUpdated", callback = format_summary }
			vim.api.nvim_create_autocmd("User", au_opts)
		end,
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
		opts = {
			skip_ts = { "string" },
			markdown = true,
		},
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
		"echasnovski/mini.comment",
		event = "VeryLazy",
		version = false,
		opts = {},
	},
	{
		"echasnovski/mini.ai",
		event = "VeryLazy",
		opts = {},
	},
	{
		"echasnovski/mini.diff",
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
		"echasnovski/mini.extra",
		version = false,
		opts = {},
	},
	{
		"echasnovski/mini.splitjoin",
		version = false,
		opts = {},
	},
}
