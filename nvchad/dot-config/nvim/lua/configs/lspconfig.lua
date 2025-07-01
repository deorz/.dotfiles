require("nvchad.configs.lspconfig").defaults()

vim.api.nvim_clear_autocmds({ event = "LspAttach" })

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local telescope = require("telescope.builtin")
    local opts = { buffer = ev.buf, noremap = true, silent = true }
    local buf = vim.lsp.buf
    local keymap = vim.keymap

    buf.references = telescope.lsp_references
    buf.definition = telescope.lsp_definitions

    opts.desc = "Go To Definition"
    keymap.set("n", "grd", function()
      telescope.lsp_definitions()
    end, opts)

    keymap.set("n", "<leader>K", function()
      vim.diagnostic.open_float(nil, { focusable = false })
    end, opts)
  end,
})

local servers = {
  dockerls = {},
  jsonls = {},
  yamlls = {},

  pyright = {
    settings = {
      pyright = { disableOrganizeImports = true },
      python = {
        analysis = {
          typeCheckingMode = "basic",
        },
      },
    },
  },
  ruff = {
    on_attach = function(client)
      if client == nil then
        return
      end
      if client.name == "ruff" then
        client.server_capabilities.hoverProvider = false
      end
    end,
  },
}

for name, opts in pairs(servers) do
  vim.lsp.enable(name)
  vim.lsp.config(name, opts)
end
