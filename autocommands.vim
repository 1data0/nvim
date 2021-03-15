" :::::::::::::::::::::::::::::( Auto Commands ):::::::::::::::::::::::::::::::

augroup MYAUTO
    autocmd BufWritePost init.vim source $MYVIMRC
    autocmd FileType *.python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
    autocmd BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType .*{html,vue} setlocal ts=2 sts=2 sw=2 expandtab
augroup END
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END

