--::::::::::::::::::( Auto install packer if not installed ):::::::::::::::::::
U = require('utils')
local install_path = U.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if U.fn.empty(U.fn.glob(install_path)) > 0 then
  U.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  U.c('packadd packer.nvim')
end
--::::::::::::::::::::::::::::::::( Plugins )::::::::::::::::::::::::::::::::::
packer = require('packer')
packer.startup(function()
  use 'wbthomason/packer.nvim'
-- use 'airblade/vim-rooter'
-- use 'mhinz/vim-signify'
-- use 'tjdevries/express_line.nvim'
use 'vim-python/python-syntax'
  -- use 'ap/vim-css-color'
-- use 'cakebaker/scss-syntax.vim'
-- use 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
-- use 'hashivim/vim-terraform'
-- use 'j5shi/CommandlineComplete.vim'
   use 'junegunn/fzf'
   use 'junegunn/fzf.vim'
   use 'vijaymarupudi/nvim-fzf'
-- use 'leafOfTree/vim-vue-plugin'
  use 'folke/which-key.nvim'
  use 'mhinz/vim-startify'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'ray-x/lsp_signature.nvim'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
-- use 'nvim-lua/completion-nvim' 
  use 'hrsh7th/nvim-compe'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-treesitter/nvim-treesitter'
-- use 'pangloss/vim-javascript'
-- use 'rakr/vim-one'
-- use 'ryanoasis/vim-devicons'
-- use 'tjdevries/nlua.nvim'
  use 'tpope/vim-commentary'
  use 'tpope/vim-dispatch'
  use 'tpope/vim-fugitive'
-- use 'tpope/vim-rhubarb'
  use 'tpope/vim-surround'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
-- use 'vim-test/vim-test'
-- use 'arcticicestudio/nord-vim'
-- use 'Badacadabra/vim-archery'
  use 'morhetz/gruvbox'
  use 'tjdevries/colorbuddy.vim'
  use 'tjdevries/gruvbuddy.nvim'
  use 'joshdick/onedark.vim'
  use 'sainnhe/everforest'
end)

U.colorscheme('onedark')
