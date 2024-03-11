require("goopey.packer")
require("goopey.bindings")
require("goopey.debug")
require("goopey.lsp")

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

--eliminate auto comments on next line
vim.api.nvim_create_autocmd("BufEnter", { callback = function() vim.opt.expandtab = false end, })
vim.api.nvim_create_autocmd("BufEnter",
	{ callback = function() vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" } end, })

vim.cmd('set noexpandtab')
vim.bo.expandtab = false
vim.o.expandtab = false
vim.opt.expandtab = false
vim.cmd('set noet')
--vim.cmd('filetype plugin off')

--telescope
require('telescope').setup { defaults = { file_ignore_patterns = { "target/*", "build/*", "Cargo.lock", "shaders/*.*.spv", "notes/*", "libs/*", "res/*", "Content/*" , "MessageEditor.exe*"} } }

--unreal engine
UNREAL_LOADED = false
local function on_project_loaded(projectPath, projectName)
	UNREAL_LOADED = true
	print("Unreal Engine project found: " .. projectName)
	vim.keymap.set("n", "<leader>x", "<cmd>UnrealBuildEditor<CR>", opts)
	vim.keymap.set("n", "<leader>q", "<cmd>UnrealGen<CR>", opts)
end

require('unreal-support').setup({ engine_path = "/home/sam/src/UnrealEngine", on_project_loaded = on_project_loaded })
