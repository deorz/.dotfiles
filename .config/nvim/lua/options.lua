local opt = vim.opt

vim.cmd("let g:netrw_banner=0")
vim.cmd("let g:netrw_liststyle=3")
vim.cmd("let g:netrw_browse_split=3")
vim.cmd("filetype indent on")
vim.cmd("set list")
vim.cmd("set listchars=trail:.")
vim.cmd("set mouse=a")

opt.number = true
opt.smartindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.wrap = false
opt.fileformat="unix"
opt.ignorecase = true
opt.smartcase = true
opt.cursorline = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.colorcolumn = "120"
opt.scrolloff = 7
opt.backspace = "indent,eol,start"
opt.clipboard:append("unnamedplus")
opt.splitright = true
opt.splitbelow = true
opt.swapfile = false
opt.confirm = true
