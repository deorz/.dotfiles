return {
	{
		"williamboman/mason-lspconfig.nvim",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
			"folke/lazydev.nvim",
			"saghen/blink.cmp",
		},
		opts = {
			ensure_installed = {
				"bashls",
				"docker_compose_language_service",
				"dockerls",
				"gopls",
				"jsonls",
				"lua_ls",
				"pyright",
				"yamlls",
			},
		},
		config = function(_, opts)
			require("mason-lspconfig").setup(opts)
			local lspconfig = require("lspconfig")
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			local diagnostics = {
				underline = true,
				update_in_insert = false,
				virtual_text = {
					spacing = 4,
					source = "if_many",
					prefix = "●",
				},
				severity_sort = true,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.HINT] = " ",
						[vim.diagnostic.severity.INFO] = " ",
					},
				},
			}
			vim.diagnostic.config(diagnostics)

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local snacks = require("snacks").picker
					local opts = { buffer = ev.buf, noremap = true, silent = true }
					local buf = vim.lsp.buf
					local keymap = vim.keymap

					buf.references = snacks.lsp_references
					buf.definition = snacks.lsp_definitions

					opts.desc = "Go To Definition"
					keymap.set("n", "grd", function()
						snacks.lsp_definitions()
					end, opts)

					opts.desc = "LSP Symbols"
					keymap.set("n", "<leader>ss", function()
						snacks.lsp_symbols()
					end, opts)
				end,
			})

			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
				["ruff"] = function()
					lspconfig.ruff.setup({
						capabilities = capabilities,
						cmd_env = { RUFF_TRACE = "messages" },
						init_options = { settings = { logLevel = "debug" } },
						on_attach = function(client)
							if client == nil then
								return
							end
							if client.name == "ruff" then
								client.server_capabilities.hoverProvider = false
							end
						end,
					})
				end,
				["pyright"] = function()
					lspconfig.pyright.setup({
						capabilities = capabilities,
						settings = {
							pyright = { disableOrganizeImports = true },
							python = {
								analysis = {
									typeCheckingMode = "basic",
								},
							},
						},
					})
				end,
				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = { globals = { "vim" } },
								completion = { callSnippet = "Replace" },
							},
						},
					})
				end,
				["gopls"] = function()
					lspconfig.gopls.setup({
						capabilities = capabilities,
						settings = {
							gopls = {
								completeUnimported = true,
								usePlaceholders = true,
							},
						},
					})
				end,
			})
			require("lazydev").setup()
		end,
	},
}
