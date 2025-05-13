local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_format" },
    xml = { "xmlformat" },
    json = { "jq" },
  },
  format_after_save = nil,
}

return options
