return {
	{
		"saghen/blink.cmp",
		event = "InsertEnter",
		version = "*",
		opts = {
			completion = {
				accept = { auto_brackets = { enabled = false } },
				list = { selection = "auto_insert" },
			},
			signature = { enabled = true },
			keymap = {
				preset = "default",
			},
			sources = {
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
		},
		opts_extend = { "sources.default" },
	},
}
