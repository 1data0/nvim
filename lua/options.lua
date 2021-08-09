-- :::::::::::::::::::::::::::::::( U.options )::::::::::::::::::::::::::::::::::
U = require('utils')
-- U.o.timeoutlen = 1000
--U.o.cursorcolumn = true
--U.o.cursorline = true
U.o.shell = '/bin/bash'
U.o.autoindent = true
U.o.autoread = true
U.o.background = "dark"
U.o.clipboard:append { 'unnamedplus' }
U.o.cmdheight = 1
U.o.completeopt = 'menuone,noinsert,noselect'
U.o.encoding = 'utf-8'
U.o.expandtab = true 
U.o.hidden = true  --Allows buffers to be switched without writing to disk 
U.o.inccommand = 'split'
U.o.incsearch = true
U.o.list = true
U.o.listchars = { tab = '-¬', trail = '-', eol = '¬' }
U.o.mouse = 'a' --Let the mouse be used for scrolling in a terminal
U.o.number = true
U.o.path:append { '**' }
U.o.relativenumber = true
U.o.rtp:append { U.home .. '/.config/nvim/plugged/fzf' }
U.o.scrolloff = 10
U.o.shiftwidth = 4 
U.o.shortmess = 'I' --Disable startup message
U.o.shortmess = 'a' --Fix error messages
U.o.signcolumn = 'yes'
U.o.smartindent = true
U.o.softtabstop = 4
U.o.splitbelow = true
U.o.splitright = true
U.o.sts = 4
U.o.tabstop = 4 
U.o.timeoutlen = 250
U.o.termguicolors = true
U.o.undodir = U.home .. '/.config/vim-persisted-undo/'
U.o.undofile = true
U.o.wrap = true
U.c "syntax on"
U.c 'filetype plugin on'
U.c 'set shortmess+=c'
tmp = {}
for i = 80,300,1
	do table.insert(tmp,i) 
end     
U.ol.colorcolumn = tmp
U.c("let g:fzf_layout = { 'down':  '40%'}")

