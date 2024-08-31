return {
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"neovim/nvim-lspconfig",
			{ "folke/lazydev.nvim", opts = {} },
		},
		opts = {
			ensure_installed = {
				"bashls",
				"eslint",
				"docker_compose_language_service",
				"dockerls",
				"gopls",
				"jsonls",
				"lua_ls",
				"markdown_oxide",
				"pyright",
				"rust_analyzer",
				"sqlls",
				"tsserver",
				"yamlls",
			},
		},
		config = function(_, opts)
			require("mason-lspconfig").setup(opts)
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			local signs = {
				Error = " ",
				Warn = " ",
				Hint = " ",
				Info = " ",
			}
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf, silent = true }
					local buf = vim.lsp.buf
					local keymap = vim.keymap

					opts.desc = "LSP Show References"
					keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)

					opts.desc = "LSP Go To Definitions"
					keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)

					opts.desc = "Code Actions"
					keymap.set({ "n", "v" }, "<leader>ca", buf.code_action, opts)
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
									ignore = { "*" },
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
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							gopls = {
								completeUnimported = true,
								usePlaceholders = true,
								analysis = {
									unusedparams = true,
								},
							},
						},
					})
				end,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("lspconfig").sourcekit.setup({
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})
		end,
	},
}
