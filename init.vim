" ::::::::::::::::::::::::::::::::( INIT.VIM ):::::::::::::::::::::::::::::::::

source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/options.vim
source $HOME/.config/nvim/functions.vim
source $HOME/.config/nvim/autocommands.vim
source $HOME/.config/nvim/mappings.vim

" ::::::::::::::::::::::::::::::::::( LSP )::::::::::::::::::::::::::::::::::::
"
lua require'lspconfig'.pyright.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.vimls.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.denols.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.gopls.setup{on_attach=require'completion'.on_attach}

" ::::::::::::::::::::::::::::::( Status line )::::::::::::::::::::::::::::::::

" :lua require('el').setup {}

" :::::::::::::::::::::::::::::::( Treesitter )::::::::::::::::::::::::::::::::
"
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
}
EOF
" ::::::::::::::::::::::::::( Plugin Configuration ):::::::::::::::::::::::::::

" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
" autocmd BufEnter * lua require'completion'.on_attach()

let g:vim_vue_plugin_load_full_syntax = 1

let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline_powerline_fonts = 1
" let g:airline_theme='term'
" let g:python_highlight_all = 1

let g:terraform_fmt_on_save=1 " Enable terramform fmt on file save.

let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" neosnippets
"
let g:neocomplete#enable_at_startup = 1
let g:neosnippet#snippets_directory='~/.config/nvim/snippets/'
imap <c-k> <Plug>(neosnippet_expand_or_jump)
smap <c-k> <Plug>(neosnippet_expand_or_jump)
xmap <c-k> <Plug>(neosnippet_expand_target)

let g:fzf_layout = { 'down': '~40%' }
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']

" " SuperTab like snippets behavior.
" imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: "\<TAB>"

let g:startify_change_to_vcs_root = 1
" let g:startify_enable_special = 0
let g:startify_custom_header = [
        \ '              ___________________________________________',
        \ '             |               _  __                       |',
        \ '             |              / |/ /_ __[ ]_ _             |',
        \ '             |             /    / |/ / /  v \            |',
        \ '             |____________/_/|_/|___/_/_/_/_/____________|',
        \]
