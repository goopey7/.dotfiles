return require('packer').startup(function()
	-- packer manages itself
	use 'wbthomason/packer.nvim'

	-- colorscheme
	--use 'rafi/awesome-vim-colorschemes'
	use 'scrooloose/NERDTree'

	--Status Bar at the bottom
	use 'vim-airline/vim-airline'
	use 'vim-airline/vim-airline-themes'

	--Dev Icons
	use 'ryanoasis/vim-devicons'

	--Provide preview of color codes
	use 'ap/vim-css-color'

	--Fuzzy finder
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'

	--Nice tab bar
	use 'kyazdani42/nvim-web-devicons'

	--Cmake integration
	use 'cdelledonne/vim-cmake'

	--Auto define cpp
	use 'tenfyzhong/vim-gencode-cpp'

	--:AV
	use 'goopey7/a.vim'

	--LazyGit
	use 'kdheepak/lazygit.nvim'

	--debugging
	use 'mfussenegger/nvim-dap'
	use 'rcarriga/nvim-dap-ui'
	use 'theHamsta/nvim-dap-virtual-text'
	use 'nvim-telescope/telescope-dap.nvim'
	use 'svermeulen/vimpeccable'

	-- COC
	--use {'neoclide/coc.nvim', branch='release'}

	-- Neoterm
	use 'kassio/neoterm'

	--Rust
	use 'goopey7/vim-cargo'

	--LSP
	use 'neovim/nvim-lspconfig'

	--Completion
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'

	--wakatime
	use 'wakatime/vim-wakatime'

	--gruvbox
	use 'morhetz/gruvbox'

	use 'tikhomirov/vim-glsl'

	use 'ray-x/lsp_signature.nvim'

	use '~/src/unreal-support.nvim'

	use 'nvim-treesitter/nvim-treesitter'
end)
