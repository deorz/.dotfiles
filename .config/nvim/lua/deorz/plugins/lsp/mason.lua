return {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"bash-language-server",
				"debugpy",
				"docker-compose-language-service",
				"dockerfile-language-server",
				"editorconfig-checker",
				"eslint-lsp",
				"eslint_d",
				"gopls",
				"gofumpt",
				"goimports",
				"json-lsp",
				"lua-language-server",
				"markdown-oxide",
				"prettier",
				"pyright",
				"ruff",
				"rust-analyzer",
				"stylua",
				"swiftlint",
				"taplo",
				"tree-sitter-cli",
				"typescript-language-server",
				"vim-language-server",
				"yaml-language-server",
				"yamlfix",
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			local function ensure_installed()
				for _, tool in ipairs(opts.ensure_installed) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end
			if mr.refresh then
				mr.refresh(ensure_installed)
			else
				ensure_installed()
			end
		end,
	},
}
