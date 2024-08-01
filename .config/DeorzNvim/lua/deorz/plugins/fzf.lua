return {
	{
		"ibhagwan/fzf-lua",
		cmd = "FzfLua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
		config = function()
			local config = require("fzf-lua.config")
			config.defaults.keymap.fzf["ctrl-q"] = "select-all+accept"
			config.defaults.keymap.fzf["ctrl-j"] = "preview-page-down"
			config.defaults.keymap.fzf["ctrl-k"] = "preview-page-up"
			config.defaults.keymap.builtin["<c-j>"] = "preview-page-down"
			config.defaults.keymap.builtin["<c-k>"] = "preview-page-up"
		end,
	},
}
