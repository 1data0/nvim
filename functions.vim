" ::::::::::::::::::::::::::::( Custom Fuctions )::::::::::::::::::::::::::::::

function! s:mod(n,m) abort
    " modulo replacement
    return ((a:n % a:m) + a:m) % a:m
endfunction


function! s:header_wrap() abort
    " Wraps text on current line :::( text ):::
    let l:end = 1
    let l:size = strwidth(getline('.'))
    let l:width = 80 - size
    if s:mod(l:width, 2)
        let l:end = 0
    endif
    let l:margin = l:width / 2-3
    exec "norm " .l:margin. "I:"
    exec "norm a( "
    exec "norm A )"
    exec "norm " .l:margin. "A:"
    if l:end
        exec "norm $x"
    endif
    exec "norm 0xxVgc"
    let l:size = strwidth(getline('.'))
    let l:add = 80 - l:size -1
    exec "norm " .l:add. "A:"
endfunction

command! Header call s:header_wrap()


function! s:pydoc() abort
    exec "norm ?^def<CR>"
    exec "norm f(yi(op"
endfunction

command! Pydoc call s:pydoc()
" Python function syntax
" function! JF()
" python3 << endpython
" import vim
" vim.current.line += "Hi!"
" endpython
" endfunction
" command! Jf call JF()
" Code folding options
" set foldmethod=syntax
" set fo

