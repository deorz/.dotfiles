return {
	"nvim-lua/plenary.nvim",
	{
		"mrjones2014/smart-splits.nvim",
		event = "VeryLazy",
		keys = {
		    {"<C-h>", function() require("smart-splits").move_cursor_left() end, "n", noremap = true, silent = true, desc = "Move Cursor Left",},
		    { "<C-j>", function() require("smart-splits").move_cursor_down() end, "n", noremap = true, silent = true, desc = "Move Cursor Down", },
		    { "<C-k>", function() require("smart-splits").move_cursor_up() end, "n", noremap = true, silent = true, desc = "Move Cursor Up", },
		    { "<C-l>", function() require("smart-splits").move_cursor_right() end, "n", noremap = true, silent = true, desc = "Move Cursor Right", },
		    { "<C-Left>", function() require("smart-splits").resize_left() end, "n", noremap = true, silent = true, desc = "Resize Left", },
		    { "<C-Down>", function() require("smart-splits").resize_down() end, "n", noremap = true, silent = true, desc = "Resize Down", },
		    { "<C-Up>", function() require("smart-splits").resize_up() end, "n", noremap = true, silent = true, desc = "Resize Up", },
		    { "<C-Right>", function() require("smart-splits").resize_right() end, "n", noremap = true, silent = true, desc = "Resize Right", },
		},
	},
}
