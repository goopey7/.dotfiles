return require('packer').startup(function ()

    -- packer manages itself
    use 'wbthomason/packer.nvim'

	-- colorscheme
    use 'rafi/awesome-vim-colorschemes'

    -- Better Syntax Support
    use 'sheerun/vim-polyglot'

    -- File Explorer
    use 'scrooloose/NERDTree'

    -- Auto pairs for '(' '[' '{'
    use 'jiangmiao/auto-pairs'

    -- Auto Complete
    use 'neoclide/coc.nvim'

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
    use 'romgrk/barbar.nvim'

    --Cmake integration
    use 'cdelledonne/vim-cmake'

    --Auto define cpp
    use 'tenfyzhong/vim-gencode-cpp'

    --LazyGit
    use 'kdheepak/lazygit.nvim'
    use 'drichardson/vim-unreal'

    --debugging
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'nvim-telescope/telescope-dap.nvim'
    use 'svermeulen/vimpeccable'

end)
