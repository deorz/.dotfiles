return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				transparent_background = true,
				integrations = {
					diffview = true,
					mason = true,
					notify = true,
					noice = true,
					which_key = true,
					gitsigns = true,
					nvim_surround = true,
					indent_blankline = {
						enabled = true,
						scope_color = "peach",
						colored_indent_levels = true,
					},
					mini = {
						enabled = true,
					},
					colorful_winsep = {
						enabled = true,
						color = "peach",
					},
				},
			})

			-- vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				transparent = true,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
				on_highlights = function(hl, c)
					-- Override background for statusline
					hl.MiniStatuslineFileinfo = { fg = c.green, bg = c.none }
					hl.MiniStatuslineFilename = { fg = c.yellow, bg = c.none }
					hl.MiniStatuslineInactive = { fg = c.blue, bg = c.none }
					-- Override background for bufferline
					hl.MiniTablineFill = { bg = c.none }
					-- Override highlighting selected item for Mini.Pick
					hl.MiniPickMatchMarked = { fg = c.yellow }
				end,
			})
			vim.cmd.colorscheme("tokyonight")
		end,
	},
}
