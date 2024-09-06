return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"mfussenegger/nvim-dap-python",
			{
				"theHamsta/nvim-dap-virtual-text",
				opts = {},
			},
		},
		config = function()
			vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
			local dap_icons = {
				Stopped = { " ", "DiagnosticWarn", "DapStoppedLine" },
				Breakpoint = " ",
				BreakpointCondition = " ",
				BreakpointRejected = { " ", "DiagnosticError" },
				LogPoint = ".>",
			}
			for name, sign in pairs(dap_icons) do
				sign = type(sign) == "table" and sign or { sign }
				vim.fn.sign_define(
					"Dap" .. name,
					{ text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
				)
			end
		end,
		keys = {
			{
				"<leader>dr",
				function()
					require("dap").continue()
				end,
				desc = "Run / Continue",
			},
			{
				"<leader>dt",
				function()
					require("dap").terminate()
				end,
				desc = "Terminate",
			},
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle Breakpoint",
			},
			{
				"<leader>dB",
				function()
					require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
				end,
				desc = "Breakpoint Condition",
			},
			{
				"<leader>dso",
				function()
					require("dap").step_over()
				end,
				desc = "Step Over",
			},
			{
				"<leader>dsi",
				function()
					require("dap").step_into()
				end,
				desc = "Step Into",
			},
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "nvim-neotest/nvim-nio" },
		keys = {
			{
				"<leader>du",
				function()
					require("dapui").toggle({})
				end,
				desc = "Dap UI",
			},
		},
		opts = {
			layouts = {
				{
					elements = {
						{
							id = "repl",
							size = 0.3,
						},
						{
							id = "scopes",
							size = 0.3,
						},
						{
							id = "watches",
							size = 0.3,
						},
					},
					position = "bottom",
					size = 30,
				},
			},
		},
		config = function(_, opts)
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup(opts)
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open({})
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close({})
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close({})
			end
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		config = function()
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
			require("dap").configurations.python = {
				{
					type = "python",
					request = "launch",
					name = "Run File",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
				{
					type = "python",
					request = "launch",
					name = "Run file with arguments",
					program = "${file}",
					cwd = "${workspaceFolder}",
					args = function()
						local args_string = vim.fn.input("Arguments: ")
						return vim.split(args_string, " +")
					end,
				},
			}
		end,
	},
}
