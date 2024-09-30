return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "echasnovski/mini.icons" },
		cmd = "FzfLua",
		opts = function()
			local actions = require("fzf-lua.actions")
			return {
				"default-title",
				defaults = {
					file_icons = "mini",
					winopts = {
						row = 0.5,
						col = 0.5,
						width = 0.65,
						height = 0.5,
						border = "rounded",
						preview = {
							scrollbar = false,
						},
					},
					keymap = {
						builtin = {
							["<ctrl-f>"] = "preview-page-down",
							["<ctrl-b>"] = "preview-page-up",
							["<S-down>"] = "preview-down",
							["<S-up>"] = "preview-up",
						},
						fzf = {
							["ctrl-q"] = "select-all+accept",
							["ctrl-u"] = "half-page-up",
							["ctrl-d"] = "half-page-down",
							["ctrl-a"] = "toggle-all",
						},
					},
				},
				files = {
					header = nil,
					actions = {
						["ctrl-g"] = { actions.toggle_ignore },
						["ctrl-h"] = { actions.toggle_hidden },
					},
				},
				grep = {
					multiline = 2,
					rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 --multiline -e",
					actions = {
						["ctrl-g"] = { actions.toggle_ignore },
						["ctrl-h"] = { actions.toggle_hidden },
					},
				},
			}
		end,
		config = function(_, opts)
			require("fzf-lua").setup(opts)
			require("fzf-lua").register_ui_select()
		end,
		keys = {
			{
				"<leader>sf",
				function()
					require("fzf-lua").files()
				end,
				"n",
				noremap = true,
				silent = true,
				desc = "Open File Picker",
			},
			{
				"<leader>sb",
				function()
					require("fzf-lua").buffers()
				end,
				"n",
				noremap = true,
				silent = true,
				desc = "Open Buffer Picker",
			},
			{
				"<leader>s/",
				function()
					require("fzf-lua").live_grep({ resume = true })
				end,
				"n",
				noremap = true,
				silent = true,
				desc = "Open Find in Files Picker",
			},
			{
				"<leader>s/",
				function()
					require("fzf-lua").grep_visual()
				end,
				mode = "v",
				noremap = true,
				silent = true,
				desc = "Grep Visual",
			},
			{
				"<leader>sl",
				function()
					require("fzf-lua").lgrep_curbuf()
				end,
				"n",
				noremap = true,
				silent = true,
				desc = "Search Lines",
			},
		},
	},
}
