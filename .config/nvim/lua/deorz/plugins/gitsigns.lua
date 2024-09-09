return {
	{
		"lewis6991/gitsigns.nvim",
		opts = function()
			return {
				current_line_blame = true,
				numhl = true,
				signs_staged_enable = true,

				signcolumn = false,
				linehl = false,
				word_diff = false,

				on_attach = function(bufnr)
					local function map(mode, lhs, rhs, opts)
						opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
						vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
					end

					-- Navigation
					map("n", "]h", "&diff ? ']h' : '<cmd>Gitsigns next_hunk<CR>'", { desc = "Next hunk", expr = true })
					map("n", "[h", "&diff ? '[h' : '<cmd>Gitsigns prev_hunk<CR>'", { desc = "Prev hunk", expr = true })

					-- Actions
					map("n", "<leader>ghs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
					map("v", "<leader>ghs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })

					map("n", "<leader>ghr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
					map("v", "<leader>ghr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })

					map("n", "<leader>ghp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })

					map(
						"n",
						"<leader>gbl",
						'<cmd>lua require"gitsigns".blame_line{full=true}<CR>',
						{ desc = "Blame line" }
					)
					map(
						"n",
						"<leader>gbt",
						"<cmd>Gitsigns toggle_current_line_blame<CR>",
						{ desc = "Toggle Blame line" }
					)

					map("n", "<leader>gd", "<cmd>Gitsigns diffthis<CR>", { desc = "Show diff" })
					map("n", "<leader>gD", '<cmd>lua require"gitsigns".diffthis("~")<CR>', { desc = "Show diff" })

					map("n", "<leader>gtd", "<cmd>Gitsigns toggle_deleted<CR>", { desc = "Toggle Deleted" })
				end,
			}
		end,
	},
}
