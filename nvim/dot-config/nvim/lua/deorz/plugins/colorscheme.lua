return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = function()
			return {
				transparent = true,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
				on_highlights = function(hl, c)
					-- Override background for bufferline
					hl.MiniTablineFill = { bg = c.none }
					-- Override hoghlight for render-markdown.nvim
					hl.RenderMarkdownCode = { bg = c.none }
				end,
			}
		end,
		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd.colorscheme("tokyonight")
		end,
	},
}
