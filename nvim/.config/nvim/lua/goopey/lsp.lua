vim.cmd('nnoremap <silent> K :<CR>')

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local default_bindings = function()
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0 })
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = 0 })
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = 0 })
	vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { buffer = 0 })
	vim.keymap.set('n', '<leader><cr>', vim.lsp.buf.code_action, { buffer = 0 })
	vim.keymap.set('v', '<leader><cr>', vim.lsp.buf.code_action, { buffer = 0 })
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = 0 })
	vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, { buffer = 0 })
	vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, { buffer = 0 })
	vim.keymap.set('n', '<leader>dl', "<cmd>Telescope diagnostics<cr>", { buffer = 0 })
	vim.keymap.set('n', '<leader>rf', "<cmd>Telescope lsp_references<cr>", { buffer = 0 })
end

--C# bindings
require'lspconfig'.csharp_ls.setup{
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		default_bindings()
		require("lsp_signature").on_attach({ hi_parameter = "LspSignatureActiveParameter" }, bufnr)
	end,
}

--D bindings
require 'lspconfig'.serve_d.setup {
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		default_bindings()
		require("lsp_signature").on_attach(nil, bufnr)
	end,
}


--Rust bindings
require 'lspconfig'.rust_analyzer.setup {
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		default_bindings()
		require("lsp_signature").on_attach(nil, bufnr)
	end,
}

--Dart bindings
require 'lspconfig'.dartls.setup {
	capabilities = capabilities,
	on_attach = function()
		default_bindings()
		require("lsp_signature").on_attach({ hi_parameter = "LspSignatureActiveParameter" }, bufnr)
	end,
}

--Clang bindings
require 'lspconfig'.clangd.setup {
	capabilities = capabilities,
	cmd = {
		"clangd",
		"--background-index",
		"--suggest-missing-includes",
		"--offset-encoding=utf-16",
	},
	on_attach = function(client, bufnr)
		default_bindings()
		require("lsp_signature").on_attach({ hi_parameter = "IncSearch" }, bufnr)
	end,
}

--GLSL
require 'lspconfig'.glslls.setup {
}

--Cmake
require 'lspconfig'.cmake.setup {}

--Lua
require 'lspconfig'.lua_ls.setup {
	on_attach = function()
		default_bindings()
	end,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}

--Markdown
require 'lspconfig'.marksman.setup {
	on_attach = function()
		default_bindings()
	end
}


--TS/JS
require 'lspconfig'.tsserver.setup {
	on_attach = function()
		default_bindings()
		require("lsp_signature").on_attach({ hi_parameter = "LspSignatureActiveParameter" }, bufnr)
	end
}

--Yaml
require 'lspconfig'.yamlls.setup {
	on_attach = function()
		default_bindings()
	end
}

--OCaml
require 'lspconfig'.ocamllsp.setup {
}

--R
require 'lspconfig'.r_language_server.setup {
	on_attach = function()
		default_bindings()
	end
}


vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Set up nvim-cmp.
local cmp = require 'cmp'

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' }, -- For luasnip users.
	}, {
		{ name = 'buffer' },
	})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
	}, {
		{ name = 'buffer' },
	})
})

