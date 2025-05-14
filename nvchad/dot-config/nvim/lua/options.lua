require "nvchad.options"

local opt = vim.opt

opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

opt.tabstop = 4 -- 4 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.autoindent = true -- copy indent from current line when starting new one

vim.o.list = true
vim.o.listchars = table.concat({ "extends:…", "nbsp:␣", "precedes:…", "tab:→ ", "trail:·" }, ",")

opt.termguicolors = true
opt.colorcolumn = "120"

opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position
-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line

opt.confirm = true
