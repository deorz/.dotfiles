local opt = vim.opt -- for conciseness

opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

opt.tabstop = 4 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false -- disable line wrapping

vim.o.list = true
vim.o.listchars = table.concat({ "extends:…", "nbsp:␣", "precedes:…", "tab:→ ", "trail:·" }, ",")

opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true -- highlight the current cursor line

opt.scrolloff = 10 -- always keep lines above and after cursor when scrolling

opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
opt.colorcolumn = "120"

opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position
-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

opt.clipboard:append("unnamedplus") -- use system clipboard as default register

opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

opt.swapfile = false

opt.confirm = true
