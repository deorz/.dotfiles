return {
	{
		"ibhagwan/fzf-lua",
		dependencies = {
			"echasnovski/mini.icons",
		},
		cmd = "FzfLua",
		opts = function()
			local actions = require("fzf-lua.actions")
			return {
				"default-title",
				defaults = {
					file_icons = "mini",
					winopts = {
						preview = {
							layout = "flex",
							flip_columns = 100,
							scrollbar = false,
						},
					},
				},
				actions = {
					files = {
						false,
						["enter"] = actions.file_edit_or_qf,
						["ctrl-s"] = actions.file_split,
						["ctrl-v"] = actions.file_vsplit,
						["ctrl-q"] = actions.file_sel_to_qf,
						["ctrl-g"] = actions.toggle_ignore,
					},
				},
				files = {
					formatter = "path.filename_first",
				},
				grep = {
					actions = {
						["ctrl-space"] = actions.grep_lgrep,
						["ctrl-g"] = actions.toggle_ignore,
						["ctrl-h"] = actions.toggle_hidden,
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
					require("fzf-lua").buffers({ sort_mru = true, sort_lastused = true })
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
			-- {
			-- 	"<leader>sv",
			-- 	function()
			-- 		local command = "rg --files --no-ignore --hidden .venv/bin/python"
			-- 		require("fzf-lua").fzf_exec(command, {
			-- 			actions = {
			-- 				["default"] = function(selected, opts)
			-- 					vim.print(selected)
			-- 				end,
			-- 			},
			-- 		})
			-- 	end,
			-- 	"n",
			-- 	noremap = true,
			-- 	silent = true,
			-- 	desc = "Search python Virtual Environments",
			-- },
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		cmd = "Telescope",
	},
	-- {
	-- 	"nvim-telescope/telescope.nvim",
	-- 	tag = "0.1.8",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	-- 		"nvim-telescope/telescope-ui-select.nvim",
	-- 	},
	-- 	cmd = "Telescope",
	-- 	opts = function()
	-- 		local actions = require("telescope.actions")
	-- 		return {
	-- 			defaults = {
	-- 				sorting_strategy = "ascending",
	-- 				layout_strategy = "center",
	-- 				layout_config = {
	-- 					prompt_position = "top",
	-- 					mirror = true,
	-- 				},
	-- 				mappings = {
	-- 					n = {
	-- 						["q"] = actions.close,
	-- 						["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
	-- 					},
	-- 					i = {
	-- 						["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
	-- 						["<C-s>"] = actions.select_horizontal,
	-- 						["<C-x>"] = false,
	-- 					},
	-- 				},
	-- 			},
	-- 			pickers = {
	-- 				buffers = {
	-- 					sort_mru = true,
	-- 					sort_lastused = true,
	-- 					ignore_current_buffer = true,
	-- 					mappings = {
	-- 						i = { ["<C-x>"] = "delete_buffer" },
	-- 						n = { ["d"] = "delete_buffer" },
	-- 					},
	-- 				},
	-- 				grep_string = {
	-- 					additional_args = { "--hidden", "--no-ignore" },
	-- 				},
	-- 				live_grep = {
	-- 					additional_args = { "--hidden", "--no-ignore" },
	-- 				},
	-- 			},
	-- 			extensions = {
	-- 				fzf = {
	-- 					fuzzy = true,
	-- 					override_generic_sorter = true,
	-- 					override_file_sorter = true,
	-- 					case_mode = "smart_case",
	-- 				},
	-- 			},
	-- 		}
	-- 	end,
	-- 	config = function(_, opts)
	-- 		require("telescope").setup(opts)
	-- 		require("telescope").load_extension("fzf")
	-- 		require("telescope").load_extension("ui-select")
	-- 	end,
	-- 	keys = {
	-- 		{
	-- 			"<leader>sf",
	-- 			function()
	-- 				require("telescope.builtin").find_files()
	-- 			end,
	-- 			"n",
	-- 			noremap = true,
	-- 			silent = true,
	-- 			desc = "Open File Picker",
	-- 		},
	-- 		{
	-- 			"<leader>sb",
	-- 			function()
	-- 				require("telescope.builtin").buffers()
	-- 			end,
	-- 			"n",
	-- 			noremap = true,
	-- 			silent = true,
	-- 			desc = "Open Buffer Picker",
	-- 		},
	-- 		{
	-- 			"<leader>s/",
	-- 			function()
	-- 				require("telescope.builtin").live_grep()
	-- 			end,
	-- 			"n",
	-- 			noremap = true,
	-- 			silent = true,
	-- 			desc = "Open Find in Files Picker",
	-- 		},
	-- 		{
	-- 			"<leader>sl",
	-- 			function()
	-- 				require("telescope.builtin").current_buffer_fuzzy_find()
	-- 			end,
	-- 			"n",
	-- 			noremap = true,
	-- 			silent = true,
	-- 			desc = "Search Lines",
	-- 		},
	-- 		{
	-- 			"<leader>sj",
	-- 			function()
	-- 				require("telescope.builtin").jumplist()
	-- 			end,
	-- 			"n",
	-- 			noremap = true,
	-- 			silent = true,
	-- 			desc = "Jumplist Picker",
	-- 		},
	-- 		{
	-- 			"<leader>sh",
	-- 			function()
	-- 				require("telescope.builtin").help_tags()
	-- 			end,
	-- 			"n",
	-- 			noremap = true,
	-- 			silent = true,
	-- 			desc = "Neovim Help Picker",
	-- 		},
	-- 	},
	-- },
}
