return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		cmd = "ConformInfo",
		opts = {
			formatters_by_ft = {
				yaml = { "yamlfix" },
				lua = { "stylua" },
				swift = { "swiftlint" },
				toml = { "taplo" },
				python = { "ruff_format" },
			},
			format_after_save = {
				lsp_format = "fallback",
			},
		},
	},
}
