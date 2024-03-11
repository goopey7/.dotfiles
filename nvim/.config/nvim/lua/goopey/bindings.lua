vim.g.mapleader = " "

local opts = { noremap = true, silent = true }

--coc bindings
--vim.cmd('source' .. vim.fn.stdpath('config') .. '/coc.vim')

--mappings for split navigations and moving buffers
vim.keymap.set("n", "<C-h>", "<cmd>bprev<CR>", opts)
vim.keymap.set("n", "<C-l>", "<cmd>bnext<CR>", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<leader>l", "<C-w>l", opts)
vim.keymap.set("n", "<leader>h", "<C-w>h", opts)

vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<CR>", opts)
vim.keymap.set("n", "<leader>j", "<cmd>NERDTreeToggle<CR>", opts)
vim.keymap.set("n", "<leader>g", "<cmd>LazyGit<CR>", opts)
vim.keymap.set("n", "<leader>w", "<cmd>bd<CR>", opts)
vim.keymap.set("n", "<leader>W", "<cmd>bd!<CR>", opts)

vim.keymap.set("n", "<leader>X", "<cmd>T clear && cd ../ && scons platform=linux && cd src<CR>", opts)
vim.keymap.set("n", "<leader>t", "<cmd>set noexpandtab<CR><cmd>retab!<CR>", opts)
vim.keymap.set("n", "<leader>F", "<cmd> lua vim.lsp.buf.format()<CR>", opts)

--yank to clipboard register
vim.keymap.set("n", "y", "\"+y")
vim.keymap.set("x", "y", "\"+y")

local function code_keymap()
	if vim.fn.has "nvim-0.7" then
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "*",
			callback = function()
				vim.schedule(CodeRunner)
			end,
		})
	else
		vim.cmd "autocmd FileType * lua CodeRunner()"
	end

	function CodeRunner()

		local bufnr = vim.api.nvim_get_current_buf()
		local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")

		if ft == "cpp" or ft == "glsl" then
			--cpp class generation
			vim.cmd('source ' .. vim.fn.stdpath('config') .. '/cppClass.vim')
			vim.keymap.set("n", "<leader>c", ":Class ", { noremap = true })

			--cpp definition generation
			vim.keymap.set("n", "<leader>D", "<cmd>GenDefinition<CR>", opts)

			--AV vertical split
			vim.keymap.set("n", "<leader>V", "<cmd>AV<CR>", opts)
			vim.keymap.set("n", "<leader>v", "<cmd>A<CR>", opts)
			vim.keymap.set("n", "<leader>n", "<cmd>A<CR>", opts)

			--cmake

		if not UNREAL_LOADED then
			vim.keymap.set("n", "<leader>q",
				"<cmd>CMakeGenerate build -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON<CR>", opts)
			vim.keymap.set("n", "<leader>Q",
				"<cmd>CMakeGenerate build -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXPORT_COMPILE_COMMANDS=ON<CR>", opts)
			vim.keymap.set("n", "<leader>x", "<cmd>CMakeBuild<CR>", opts)

			vim.keymap.set("n", "<leader>X", "<cmd>terminal find build -type f -executable -exec {} \\;<CR>", opts)

			vim.keymap.set("n", "<leader>z", "<cmd>CMakeClose<CR>", opts)
		end
		elseif ft == "rust" then
			--vim.keymap.set("n", "<leader>x", "<cmd>CargoBuild<CR>",opts)
			--vim.keymap.set("n", "<leader>X", "<cmd>CargoRun<CR>",opts)
		end

		--debugging
		vim.keymap.set("n", "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
		vim.keymap.set("n", "<leader>B",
			"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
		vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", opts)
		vim.keymap.set("n", "<leader>dc", ":lua require'dap'.continue()<CR>", opts)
		vim.keymap.set("n", "<leader>dsi", ":lua require'dap'.step_into()<CR>", opts)
		vim.keymap.set("n", "<leader>dso", ":lua require'dap'.step_over()<CR>", opts)
		vim.keymap.set("n", "<leader>du", ":lua require'dapui'.toggle()<CR>", opts)
		vim.keymap.set("n", "<leader>ddb", "<cmd>Clbps<CR>", opts)
	end
end

code_keymap()
