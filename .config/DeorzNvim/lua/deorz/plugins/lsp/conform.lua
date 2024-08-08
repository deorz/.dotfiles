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
				javascript = { "prettier", "eslint_d", stop_after_first = true },
				typescript = { "prettier", "eslint_d", stop_after_first = true },
			},
			format_after_save = {
				lsp_format = "fallback",
			},
		},
	},
}
