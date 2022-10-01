vim.g.mapleader = " "

local opts = {noremap = true, silent = true}

--coc bindings
vim.cmd('source' .. vim.fn.stdpath('config') .. '/coc.vim')

--mappings for split navigations and moving buffers
vim.keymap.set("n", "<C-h>", "<cmd>TablineBufferPrevious<CR>",opts)
vim.keymap.set("n", "<C-l>", "<cmd>TablineBufferNext<CR>",opts)
vim.keymap.set("n", "<C-j>", "<C-w>j",opts)
vim.keymap.set("n", "<C-k>", "<C-w>k",opts)
vim.keymap.set("n", "<leader>l", "<C-w>l",opts)
vim.keymap.set("n", "<leader>h", "<C-w>h",opts)

vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<CR>",opts)
vim.keymap.set("n", "<leader>j", "<cmd>NERDTreeToggle<CR>",opts)
vim.keymap.set("n", "<leader>g", "<cmd>LazyGit<CR>",opts)
vim.keymap.set("n", "<leader>w", "<cmd>bd<CR>",opts)
vim.keymap.set("n", "<leader>W", "<cmd>bd!<CR>",opts)
vim.keymap.set("n", "<leader>q", "<cmd>CMakeGenerate build<CR>",opts)
vim.keymap.set("n", "<leader>x", "<cmd>CMakeBuild<CR>",opts)
vim.keymap.set("n", "<leader>z", "<cmd>CMakeClose<CR>",opts)
vim.keymap.set("n", "<leader>d", "<cmd>GenDefinition<CR>",opts)
vim.keymap.set("n", "<leader>v", "<cmd>AV<CR>",opts)
vim.keymap.set("n", "<leader>t", "<cmd>set noexpandtab<CR><cmd>retab!<CR>",opts)

--yank to clipboard register
vim.keymap.set("n", "y", "\"+y")
vim.keymap.set("x", "y", "\"+y")

--cpp class generation
vim.cmd('source ' .. vim.fn.stdpath('config') .. '/cppClass.vim')
vim.keymap.set("n", "<leader>c", ":Class ",{noremap=true})

--debugging
vim.keymap.set("n","<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>",opts)
vim.keymap.set("n","<leader>B", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",opts)
vim.keymap.set("n","<leader>dr",":lua require'dap'.repl.open()<CR>",opts)
vim.keymap.set("n","<leader>dc",":lua require'dap'.continue()<CR>",opts)

