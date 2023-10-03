"C++ CLASS GENERATOR: OPENING 2 NEW FILES
function! ClassNew(ClassName)
    let l:current_directory = expand('%:p:h')  " Get the current buffer's directory

    "==================  editing header file =================================
    let l:header_file = l:current_directory . '/' . a:ClassName . '.h'
    execute 'e ' . l:header_file
    "At this stage the autocommands for this filetype are done.
    "   example: inserting the header, and the ifndef... Then:
    :execute "normal! a//Sam Collier 2023\<cr>"
    :execute "normal! a#pragma once\<cr>\<cr>\<cr>"
    :execute "normal! a" . "class " . a:ClassName ."\<cr>{\<cr>"
    :execute "normal! a\<tab>public:\<cr>"
    :execute "normal! a\<tab>\<tab>" . a:ClassName . "(const " . a:ClassName . "&) = delete;\<cr>"
    :execute "normal! a\<tab>\<tab>" . a:ClassName . "& operator=(const " . a:ClassName . "&) = delete;\<cr>"
    :execute "normal! a\<tab>\<tab>" . a:ClassName . "();\<cr>"
    :execute "normal! a\<tab>\<tab>~" . a:ClassName . "();\<cr>"
    :execute "normal! a\<tab>protected:\<cr>"
    :execute "normal! a\<tab>private:\<cr>"
    :execute "normal! a};\<cr>"
    :execute "normal! kka"
    "Comment out this line if you don't want to start in insert mode
    ":startinsert!
    "Comment this line if you don't want to save files straight away.
    ":execute 'write'

    "==================  editing source file =================================
    let l:source_file = l:current_directory . '/' . a:ClassName . '.cpp'
    execute 'vsp ' . l:source_file
    "At this stage the autocommands for this filetype are done.
    "   example: inserting the header, and the ifndef... Then:
    :execute "normal! a//Sam Collier 2023\<cr>\<cr>"
    :execute "normal! a#include \"" . a:ClassName . ".h\"\<cr>\<cr>"
    :execute "wincmd h"
    "Comment this line if you don't want to save files straight away.
    ":execute 'write'
endfunction

command! -nargs=1 Class call ClassNew(<f-args>)

