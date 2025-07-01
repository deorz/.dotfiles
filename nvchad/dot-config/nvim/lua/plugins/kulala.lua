return {
  {
    "mistweaverco/kulala.nvim",
    ft = { "http", "rest" },
    opts = {
      global_keymaps = true,
      global_keymaps_prefix = "<leader>r",
      lsp = {
        formatter = true,
      },
      contenttypes = {
        ["application/x-iata.ndc.v1+xml"] = {
          ft = "xml",
          formatter = { "xmllint", "--format", "-" },
          pathresolver = { "xmllint", "--xpath", "{{path}}", "-" },
        },
      },
    },
  },
}
