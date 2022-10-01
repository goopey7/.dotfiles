require("goopey.packer")
require("goopey.bindings")

vim.g.airline_theme = 'apprentice'
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.undodir = vim.fn.stdpath('config') .. '/undodir'
vim.opt.hidden = true
vim.wo.wrap = false
vim.opt.hlsearch = false
vim.opt.errorbells = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.colorcolumn = '100'
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.background = 'dark'
vim.g.gruvbox_contrast_dark = 'hard'
vim.cmd('colorscheme gruvbox')
--get rid of gross white tab
vim.cmd('\
hi BufferTabpageFill guifg=#9e3333\
hi BufferVisible guifg=#9e3333\
hi BufferVisibleIndex guifg=#9e3333\
hi BufferVisibleMod guifg=#9e3333\
hi BufferVisibleSign guifg=#9e3333\
hi BufferInactive guifg=#9e3333\
hi BufferInactiveIndex guifg=#9e3333\
hi BufferInactiveMod guifg=#9e3333\
hi BufferInactiveSign guifg=#9e3333\
	')

