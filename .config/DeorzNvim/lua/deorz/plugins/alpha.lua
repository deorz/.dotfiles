return {
	{
		"goolord/alpha-nvim",
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")
			dashboard.section.buttons.val = {
				dashboard.button("leader ee", " Open File Explorer", "<cmd>Neotree float<cr>"),
				dashboard.button("leader sf", " Open File Search Picker", "<cmd>FzfLua files<cr>"),
				dashboard.button("leader lg", " Open LazyGit", "<cmd>LazyGit<cr>"),
				dashboard.button("q", " Quit NVIM", "<cmd>qa<CR>"),
			}

			dashboard.config.opts.noautocmd = true
			vim.cmd([[autocmd User AlphaReady echo 'ready']])

			alpha.setup(dashboard.config)
		end,
	},
}
