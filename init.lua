--::::::::::::::::::( Auto install packer if not installed ):::::::::::::::::::
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local f = vim.fn

if f.empty(f.glob(install_path)) > 0 then
  f.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

--::::::::::::::::::::::::::::::::( Plugins )::::::::::::::::::::::::::::::::::
packer = require('packer')
packer.startup(function()
-- use 'Shougo/deoppet.nvim', { 'do': ':UpdateRemote  useins' }
-- use 'SirVer/ultisnips'
-- use 'airblade/vim-rooter'
-- use 'dbeniamine/cheat.sh-vim'
-- use 'deoplete-plugins/deoplete-go'
-- use 'deoplete-plugins/deoplete-jedi'
-- use 'honza/vim-snippets'
-- use 'honza/vim-snippets'
-- use 'mhinz/vim-signify'
-- use 'nathanaelkane/vim-indent-guides'
-- use 'neoclide/coc.nvim', {'branch': 'release'}
-- use 'numirias/semshi', {'do': ':UpdateRemote  useins'}
-- use 'tjdevries/express_line.nvim'
-- use 'vim-python/python-syntax'
-- use 'Badacadabra/vim-archery'
-- use 'Raimondi/delimitMate'
-- use 'Shougo/deoplete.nvim', { 'do': ':UpdateRemote  useins' }
-- use 'Shougo/deoppet.nvim', { 'do': ':UpdateRemote  useins' }
-- use 'Shougo/neosnippet-snippets'
-- use 'Shougo/neosnippet.vim'
  use 'ap/vim-css-color'
-- use 'arcticicestudio/nord-vim'
-- use 'cakebaker/scss-syntax.vim'
-- use 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
-- use 'hashivim/vim-terraform'
-- use 'j5shi/CommandlineComplete.vim'
-- use 'junegunn/fzf', { 'do': { -> fzf#install() } }
-- use 'junegunn/fzf.vim', { 'do': { -> fzf#install() } }
-- use 'leafOfTree/vim-vue-plugin'
  use 'liuchengxu/vim-which-key'
  use 'mhinz/vim-startify'
-- use 'neovim/nvim-lspconfig'
-- use 'nvim-lua/completion-nvim' 
-- use 'nvim-lua/plenary.nvim'
-- use 'nvim-lua/popup.nvim'
-- use 'nvim-telescope/telescope.nvim'
  use 'nvim-treesitter/nvim-treesitter'
-- use 'pangloss/vim-javascript'
-- use 'rakr/vim-one'
-- use 'ryanoasis/vim-devicons'
-- use 'tjdevries/nlua.nvim'
  use 'morhetz/gruvbox'
  use 'tpope/vim-commentary'
  use 'tpope/vim-dispatch'
  use 'tpope/vim-fugitive'
-- use 'tpope/vim-rhubarb'
  use 'tpope/vim-surround'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
-- use 'vim-test/vim-test'
end)

-- Set colour scheme
vim.cmd "colorscheme gruvbox"

--::::::::::::::::::::::::::::::::( Mappings ):::::::::::::::::::::::::::::::::
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Legacy still to be converted to lua
vim.cmd 'source $HOME/.config/nvim/mappings.vim'

--::::::::::::::::::::::( Functions and Auto commands )::::::::::::::::::::::::

-- Legacy still to be converted to lua
vim.cmd 'source $HOME/.config/nvim/functions.vim'
vim.cmd 'source $HOME/.config/nvim/autocommands.vim'

--::::::::::::::::::::::::::::( Editors options )::::::::::::::::::::::::::::::
vim.opt.undofile = true
vim.opt.undodir = '~/.config/vim-persisted-undo/'
vim.opt.autoread = true
vim.opt.autoindent = true
vim.opt.clipboard:append { 'unnamedplus' }
vim.opt.cmdheight = 1
tmp = {}
for i = 80,300,1
	do table.insert(tmp,i) 
end     
vim.opt_local.colorcolumn = tmp
vim.opt.encoding = 'utf-8'
vim.opt.expandtab = true 
vim.opt.hidden = true  --Allows buffers to be switched without writing to disk 
vim.opt.incsearch = true
vim.opt.listchars = { tab = '^¬', trail = '-', eol = '¬' }
vim.opt.mouse = 'a' --Let the mouse be used for scrolling in a terminal
vim.opt.wrap = true
vim.opt.number = true
vim.opt.path:append { '**' }
vim.opt.relativenumber = true
vim.opt.rtp:append { '~/.config/nvim/plugged/fzf' }
vim.opt.scrolloff = 10
vim.opt.shiftwidth = 4 
vim.opt.shortmess = 'I' --Disable startup message
vim.opt.shortmess = 'a' --Fix error messages
vim.opt.signcolumn = 'yes'
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.sts = 4
vim.opt.tabstop = 4 
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0 
vim.opt.inccommand = 'split'
--vim.opt.cursorcolumn = true
--vim.opt.cursorline = true
vim.cmd "syntax on"
vim.cmd 'filetype plugin on'
vim.opt.completeopt = 'menuone,noinsert,noselect'
--colorscheme one
--colorscheme nord
--colorscheme archery


require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
}
