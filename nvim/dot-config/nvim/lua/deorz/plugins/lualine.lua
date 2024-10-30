return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = function()
			local check_macro_recording = function()
				if vim.fn.reg_recording() ~= "" then
					return "Recording @" .. vim.fn.reg_recording()
				else
					return ""
				end
			end
			return {
				options = {
					theme = "catppuccin",
					component_separators = { left = "|", right = "|" },
					section_separators = { left = " ", right = " " },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = {
						{ "filename", path = 1, separator = "" },
						{ "filetype", icon_only = true },
						{ "diff" },
					},
					lualine_x = {
						"diagnostics",
						check_macro_recording,
						"encoding",
						"fileformat",
						"filetype",
					},
				},
			}
		end,
	},
}
