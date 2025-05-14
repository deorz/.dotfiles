return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_format" },
        xml = { "xmlformat" },
        json = { "jq" },
      },
      format_after_save = nil,
    },
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ lsp_format = "fallback", async = true })
        end,
        mode = { "n", "v" },
        noremap = true,
        silent = true,
        desc = "Format file",
      },
    },
  },
}
