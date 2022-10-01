return require('packer').startup(function ()

    -- packer manages itself
    use 'wbthomason/packer.nvim'

	-- colorscheme
    --use 'rafi/awesome-vim-colorschemes'
	use 'gruvbox-community/gruvbox'

    -- Better Syntax Support
    use 'sheerun/vim-polyglot'

    -- File Explorer
    use 'scrooloose/NERDTree'

    -- Auto Complete
    use {'neoclide/coc.nvim', branch='release'}

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
    use {
  'kdheepak/tabline.nvim',
  config = function()
    require'tabline'.setup {
      -- Defaults configuration options
      enable = true,
      options = {
      -- If lualine is installed tabline will use separators configured in lualine by default.
      -- These options can be used to override those settings.
        max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
        show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
        show_devicons = true, -- this shows devicons in buffer section
        show_bufnr = false, -- this appends [bufnr] to buffer section,
        show_filename_only = true, -- shows base filename only instead of relative path in filename
        modified_icon = "+ ", -- change the default modified icon
        modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
        show_tabs_only = false, -- this shows only tabs instead of tabs + buffers
      }
    }
    vim.cmd[[
      set guioptions-=e " Use showtabline in gui vim
      set sessionoptions+=tabpages,globals " store tabpages and globals in session
    ]]
  end,
  requires = { { 'hoob3rt/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true} }
}

    --Cmake integration
    use 'cdelledonne/vim-cmake'

    --Auto define cpp
    use 'tenfyzhong/vim-gencode-cpp'

	--:AV
	use 'goopey7/a.vim'

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
