return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		dependencies = { "mason.nvim" },
		lazy = true,
		cmd = "ConformInfo",
		opts = {
			formatters_by_ft = {
				yaml = { "yamlfix" },
				lua = { "stylua" },
				toml = { "taplo" },
				python = { "ruff_format" },
				go = { "goimports", "gofumpt" },
			},
			format_after_save = nil,
		},
		keys = {
            -- stylua: ignore
			{"<leader>cf", function() require("conform").format({ lsp_format = "fallback", async = true }) end, mode={ "n", "v" }, noremap = true, silent = true, desc = "Format file"},
		},
	},
}
