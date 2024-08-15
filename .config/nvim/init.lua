local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
	vim.cmd('echo "Installing `mini.nvim`" | redraw')
	local clone_cmd = {
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/echasnovski/mini.nvim",
		mini_path,
	}
	vim.fn.system(clone_cmd)
	vim.cmd("packadd mini.nvim | helptags ALL")
	vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

require("mini.deps").setup({ path = { package = path_package } })
require("options")
require("mappings")

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
	add({ source = "folke/tokyonight.nvim" })
	require("tokyonight").setup({
		transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			}
	})
	vim.cmd("colorscheme tokyonight")
end)
now(function()
	require("mini.notify").setup()
	vim.notify = require("mini.notify").make_notify()
end)
now(function()
	require("mini.icons").setup()
end)
now(function()
	require("mini.tabline").setup()
end)
now(function()
	require("mini.statusline").setup()
end)

-- Safely execute later
later(function()
	require("mini.ai").setup()
end)
later(function()
	require("mini.comment").setup()
end)
later(function()
	require("mini.pick").setup()
end)
later(function()
	require("mini.surround").setup()
end)
later(function()
	require("mini.diff").setup()
end)
