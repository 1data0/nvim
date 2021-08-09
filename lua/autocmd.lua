-- :::::::::::::::::::::::::::::::( Autocmd )::::::::::::::::::::::::::::::::::
local U = require('utils')
U.c([[
augroup MYAUTO
    autocmd BufWritePost init.lua source $MYVIMRC
    autocmd FileType *.python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
    autocmd BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType go setlocal ts=4 sts=4 sw=4 expandtab
    autocmd BufEnter *.template setlocal ts=2 sts=2 sw=2 syntax=json expandtab
    autocmd FileType .*{html,vue} setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType yaml,yml,json,py,sh autocmd BufWritePre <buffer> %s/\s\+$//e
    autocmd TermOpen * setlocal nonumber norelativenumber
    autocmd TermOpen term://* startinsert
    autocmd BufWritePost *.py Make lint
    autocmd TermClose * call feedkeys("<CR>")
augroup END
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END
]])
