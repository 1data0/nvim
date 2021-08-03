" ::::::::::::::::::::::::::::::( Set options )::::::::::::::::::::::::::::::::

"set termguicolors
set autoread
set autoindent
set clipboard+=unnamedplus
set cmdheight=1
set colorcolumn=80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199
set encoding=utf-8
set expandtab 
set hidden  "Allows buffers to be switched without writing to disk 
set incsearch
set listchars=tab:^¬,trail:-,eol:¬ list
set mouse=a " Let the mouse be used for scrolling in a terminal
set nocompatible
set noerrorbells
set nohlsearch
set nowrap 
set number
set path+=**
set relativenumber
set rtp+=~/.config/nvim/plugged/fzf
set scrolloff=10
set shiftwidth=4 
set shortmess=I " Disable startup message
set shortmess=a " Fix error messages
set signcolumn=yes
set smartindent
set softtabstop=4
set sts=4
set tabstop=4 
set timeoutlen=1000
set ttimeoutlen=0
set inccommand=split
"set cursorcolumn
"set cursorline
syntax on
filetype plugin on
set completeopt=menuone,noinsert,noselect
" colorscheme one
" colorscheme nord
" colorscheme archery
colorscheme gruvbox

" Bracket hihlight
hi MatchParen cterm=underline ctermbg=green ctermfg=black

" " redraw!
hi Normal guibg=NONE ctermbg=NONE
augroup COLOR
    autocmd ColorScheme gruvbox hi Normal ctermbg=blue
augroup END

" guard for distributions lacking the 'persistent_undo' feature.
if has('persistent_undo')
    " define a path to store persistent undo files.
    let target_path = expand('~/.config/vim-persisted-undo/')
    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call system('mkdir -p ' . target_path)
    endif
    " point Vim to the defined undo directory.
    let &undodir = target_path
    " finally, enable undo persistence.
    set undofile
endif

