let mapleader = " "
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/vim-plug/coc.vim
colorscheme jellybeans
let g:airline_theme='apprentice'
set tabstop=4
set shiftwidth=4
set nu
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set nowrap
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set scrolloff=8
set signcolumn=yes
set colorcolumn=100
set splitbelow splitright
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"mappings for split navigations so it's ctrl + hjkl
nnoremap <C-h> :bprev<CR>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> :bnext<CR>

nnoremap <leader>f :Telescope find_files<CR>
"nnoremap <leader>j :NERDTreeClose<CR>
nnoremap <leader>g :LazyGit<CR>
nnoremap <leader>l <C-w>l
nnoremap <leader>h <C-w>h
nnoremap <leader>w :bd<CR>
nnoremap <leader>b :CMakeGenerate<CR> :CMakeBuild<CR>
nnoremap <leader>q :CMakeGenerate<CR>
nnoremap <leader>x :CMakeBuild<CR>
nnoremap <leader>z :CMakeClose<CR>
nnoremap <leader>d :GenDefinition<CR>
nnoremap <leader>c :Class 
nnoremap <leader>v :AV<CR>

    "C++ CLASS GENERATOR: OPENING 2 NEW FILES
function! ClassNew(ClassName)
    "==================  editing header file =================================
    execute "e " . a:ClassName . ".h"
    "At this stage the autocomands for this filetype are done.
    "   example: inserting the header, and the ifndef... Then:
	:execute "normal! a//Copyright Sam Collier 2022\<cr>"
	:execute "normal! a#pragma once\<cr>\<cr>\<cr>"
    :execute "normal! a" . "class " . a:ClassName ."\<cr>{\<cr>"
    :execute "normal! a\<tab>public:\<cr>"
    :execute "normal! a\<tab>\<tab>" . a:ClassName . "();\<cr>"
    :execute "normal! a\<tab>\<tab>~" . a:ClassName . "();\<cr>\<cr>"
    :execute "normal! a\<tab>protected:\<cr>\<cr>"
    :execute "normal! a\<tab>private:\<cr>\<cr>"
    :execute "normal! a};\<cr>"
    :execute "normal! kka\<tab>\<tab>"
    "Comment out this line if you dont want to start in insert mode
    ":startinsert!
    "Comment this line if you dont want to save files straight away.
    :execute 'write'
"==================  editing source file =================================
    execute "vsp %:h/" . a:ClassName . ".cpp"

    "At this stage the autocomands for this filetype are done.
    "   example: inserting the header, and the ifndef... Then:
	:execute "normal! a//Copyright Sam Collier 2022\<cr>\<cr>"
    :execute "normal! a#include \"" . a:ClassName . ".h\"\<cr>\<cr>"
    :execute "normal! a" . a:ClassName . "::" . a:ClassName ."()\<cr>{\<cr>"
    :execute "normal! a}\<cr>\<cr>"
    :execute "normal! a" . a:ClassName . "::~" . a:ClassName ."()\<cr>{\<cr>"
    :execute "normal! a}"
	:execute "wincmd h"
    "Comment this line if you dont want to save files straight away.
    ":execute 'write'
    endfunction

command! -nargs=1 Class call ClassNew(<f-args>)
