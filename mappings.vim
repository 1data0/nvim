" ::::::::::::::::::::::::::::::( Key Mappings ):::::::::::::::::::::::::::::::

" nnoremap <Space> <Nop> 
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
let g:which_key_timeout = 1
let g:which_key_map =  {}




nnoremap <leader>x :close<CR>
nnoremap <leader>ph i#!/usr/bin/env python3<CR>
nnoremap <leader>pt :w<CR>:!tox<CR>
nnoremap <leader>pb :!clear; python3 %<CR>
let g:which_key_map['p'] = [ 'name', '+python' ]
let g:which_key_map.p = {
      \ 'Python' : '+python' ,
      \ 'h' : ['i#!/usr/bin/env python3'      , 'Python Header'],
      \ 't' : [':w<CR>:!tox<CR>'                  , 'Run tox'],
      \ 'b' : [':!clear; python3 %<CR'        , 'Execute %'],
      \ }

nnoremap <leader>, ci"
nnoremap <leader>" $F"ci"
let g:which_key_map[','] = [ 'ci"', 'Edit in frist "' ]
let g:which_key_map['"'] = [ '$F"ci"', 'Edit in last "' ]


let g:which_key_map['b'] = [ 'name', '+buffer' ]
let g:which_key_map.b = {
      \ 'Buffer' : '+buffer' ,
      \ 'd' : [':bd'      , 'Delete buffer'],
      \ }


let g:which_key_map.g = {'Git' : '+git'}
let g:which_key_map.g.s = 'Git Status'
nnoremap <leader>gs :Gstatus<CR>
let g:which_key_map.g.p = 'Git Push'
nnoremap <leader>gp :Git push<CR>
let g:which_key_map.g.o = 'Git Open File'
" nnoremap <Leader>go :lua require'telescope.builtin'.git_files(require('telescope.themes').get_dropdown({}))<cr>
nnoremap <Leader>go :GFiles<CR>
let g:which_key_map.g.d = 'Git Diff'
nnoremap <leader>gd :Gvdiffsplit!<CR>


nnoremap <leader>sh i#!/bin/bash<CR>
nnoremap <leader>c :e ~/.config/nvim/init.vim<CR>
" nnoremap <leader>r :Rg<CR>
nnoremap <leader>r :%s/<C-r><C-w>/
" nnoremap <leader>o :FzfPreviewProjectFiles<CR>
" nnoremap <leader>h :set hlsearch!<CR>
" nnoremap <leader>lc :w<CR>call startjob(["cfn-lint", %])
nnoremap <leader>n :cn<CR>
nnoremap <leader>a :args **/*<CR>
" nnoremap <leader>s :w !sudo tee %<CR>
"
let g:which_key_map.s = 'Toggle Spell check'
nnoremap <leader>s :setlocal spell!<CR>

let g:which_key_map.w = 'Close Buffer'
nnoremap <leader>w :bd<CR>

let g:which_key_map.q = 'Quit Nvim'
nnoremap <leader>q :q<CR>

let g:which_key_map.f = 'Fullscreen'
nnoremap <leader>f :tabnew %<CR>

let g:which_key_map.o = 'Open file'
nnoremap <leader>o :Files ./<CR>

let g:which_key_map.H = 'Comment header'
nnoremap <leader>H :Header<CR>
" nnoremap <leader>q :Pydoc<CR>

let g:which_key_map.h = 'Move Left'
nnoremap <leader>h <C-w>h
let g:which_key_map.j = 'Move Down'
nnoremap <leader>j <C-w>j
let g:which_key_map.k = 'Move Up'
nnoremap <leader>k <C-w>k
let g:which_key_map.l = 'Move Right'
nnoremap <leader>l <C-w>l

" nnoremap <leader><space> :Buffers<CR> 
" nnoremap <Leader><leader> :lua require'telescope.builtin'.buffers(require('telescope.themes'))<cr>
nnoremap <Leader><leader> :Buffers<CR>

let g:which_key_map.L = {'Lint':'+lint'}
let g:which_key_map.L.p = 'python'
nnoremap <leader>Lp :w<CR>:set makeprg=pylama\ %<CR>:silent! make<CR>:cw<CR>:cfirst<CR>
let g:which_key_map.L.c = 'cloudformation'
nnoremap <leader>Lc :w<CR>:set makeprg=cfn-lint<CR>:Make! %<CR>:cfirst<CR>
let g:which_key_map.e = 'QuickFix List'
nnoremap <leader>e :Copen!<CR>
nnoremap <leader>zp V3jp:w<CR>

" cmap <c-p> <Plug>CmdlineCompleteBackward
" cmap <c-n> <Plug>CmdlineCompleteForward


	" call deoppet#initialize()
	" call deoppet#custom#option('snippets',
	" \ map(globpath(&runtimepath, 'snippets', 1, 1),
	" \     "{ 'path': v:val }"))

	" imap <c-k>  <Plug>(deoppet_expand)
	" imap <c-f>  <Plug>(deoppet_jump_forward)     <Plug>(neosnippet_expand_target)

" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
