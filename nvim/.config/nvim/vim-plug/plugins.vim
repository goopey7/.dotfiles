" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Auto Complete
    Plug 'neoclide/coc.nvim', {'branch' : 'release'}
    "Surrounding ysw)
    Plug 'tpope/vim-surround'
    "Commenting with gcc & gc
    Plug 'tpope/vim-commentary'
    "Status Bar at the bottom
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    "Dev Icons
    Plug 'ryanoasis/vim-devicons'
    "Provide preview of color codes
    Plug 'ap/vim-css-color'
    "Collection of colorschemes
    Plug 'rafi/awesome-vim-colorschemes'
    "Tagbar for code navigation
    Plug 'preservim/tagbar'
    "C++ syntax highlighting
    Plug 'octol/vim-cpp-enhanced-highlight'
    "Fuzzy finder
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    "Nice tab bar
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'romgrk/barbar.nvim'
	"Cmake integration
	Plug 'cdelledonne/vim-cmake'
	"Auto define cpp
	Plug 'tenfyzhong/vim-gencode-cpp'
	Plug 'vim-scripts/a.vim'
	"LazyGit
	Plug 'kdheepak/lazygit.nvim'
	"JS Server
	Plug 'neoclide/coc-tsserver'
	Plug 'pangloss/vim-javascript'

	Plug 'leafgarland/typescript-vim'
	Plug 'peitalin/vim-jsx-typescript'
	Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
	Plug 'jparise/vim-graphql'
	Plug 'maxmellon/vim-jsx-pretty'
	Plug 'dense-analysis/ale'
    call plug#end()
