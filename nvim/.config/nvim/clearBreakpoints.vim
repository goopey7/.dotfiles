function! ClearBreakpoints() 
    exec "lua require'dap'.list_breakpoints()"
    for item in getqflist()
        exec "exe " . item.lnum . "|lua require'dap'.toggle_breakpoint()"
    endfor
endfunction

command! -nargs=0 Clbps call ClearBreakpoints()
