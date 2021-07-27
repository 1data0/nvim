local O = vim.opt
local OL = vim.opt_local
local G = vim.g
local Cmd = vim.cmd
local Fn = vim.fn
local Api = vim.api
local U = {}

cfg = '$HOME/.config/nvim/'
function load (file)
    Cmd("source " .. cfg .. file)
end
O.shell = '/bin/bash'
--::::::::::::::::::( Auto install packer if not installed ):::::::::::::::::::
local install_path = Fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if Fn.empty(Fn.glob(install_path)) > 0 then
  Fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  Cmd 'packadd packer.nvim'
end

--::::::::::::::::::::::::::::::::( Plugins )::::::::::::::::::::::::::::::::::
packer = require('packer')
packer.startup(function()
  use 'wbthomason/packer.nvim'
-- use 'airblade/vim-rooter'
-- use 'mhinz/vim-signify'
-- use 'tjdevries/express_line.nvim'
-- use 'vim-python/python-syntax'
  use 'ap/vim-css-color'
-- use 'cakebaker/scss-syntax.vim'
-- use 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
-- use 'hashivim/vim-terraform'
-- use 'j5shi/CommandlineComplete.vim'
-- use 'junegunn/fzf', { 'do': { -> fzf#install() } }
-- use 'junegunn/fzf.vim', { 'do': { -> fzf#install() } }
-- use 'leafOfTree/vim-vue-plugin'
  use 'folke/which-key.nvim'
  use 'mhinz/vim-startify'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'ray-x/lsp_signature.nvim'
  use 'nvim-lua/completion-nvim' 
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

--:::::::::::::::::::::::::::::::::( Themes )::::::::::::::::::::::::::::::::::
-- use 'arcticicestudio/nord-vim'
-- use 'Badacadabra/vim-archery'
  use 'morhetz/gruvbox'
end)

-- Set colour scheme
Cmd "colorscheme gruvbox"

--::::::::::::::::::::::( Functions and Auto commands )::::::::::::::::::::::::

-- Legacy still to be converted to lua
load("functions.vim")
-- load("autocommands.vim")

--::::::::::::::::::::::::::::( Editors options )::::::::::::::::::::::::::::::
O.undofile = true
O.undodir = '~/.config/vim-persisted-undo/'
O.autoread = true
O.autoindent = true
O.clipboard:append { 'unnamedplus' }
O.cmdheight = 1
tmp = {}
for i = 80,300,1
	do table.insert(tmp,i) 
end     
OL.colorcolumn = tmp
O.encoding = 'utf-8'
O.expandtab = true 
O.hidden = true  --Allows buffers to be switched without writing to disk 
O.incsearch = true
O.listchars = { tab = '^¬', trail = '-', eol = '¬' }
O.mouse = 'a' --Let the mouse be used for scrolling in a terminal
O.wrap = true
O.number = true
O.path:append { '**' }
O.relativenumber = true
O.rtp:append { '~/.config/nvim/plugged/fzf' }
O.scrolloff = 10
O.shiftwidth = 4 
O.shortmess = 'I' --Disable startup message
O.shortmess = 'a' --Fix error messages
O.signcolumn = 'yes'
O.smartindent = true
O.softtabstop = 4
O.sts = 4
O.tabstop = 4 
-- O.timeoutlen = 1000
O.timeoutlen = 250
O.inccommand = 'split'
--O.cursorcolumn = true
--O.cursorline = true
Cmd "syntax on"
Cmd 'filetype plugin on'
O.completeopt = 'menuone,noinsert,noselect'
--colorscheme one
--colorscheme nord
--colorscheme archery
Cmd 'set shortmess+=c'

--::::::::::::::::::::::::::::::::( Mappings ):::::::::::::::::::::::::::::::::

G.mapleader = ' '
G.maplocalleader = ','

-- completion-nvim mappings
Cmd('imap <tab> <Plug>(completion_smart_tab)')
Cmd('imap <s-tab> <Plug>(completion_smart_s_tab)')
-- Cmd('inoremap <expr> <Tab>   pumvisible() ? "<C-n>" : "<Tab>"')
-- Cmd('inoremap <expr> <S-Tab> pumvisible() ? "<C-p>" : "<S-Tab>"')
local wk = require("which-key")
-- wk.register({
--     ["<tab>"] = { "<Plug>(completion_smart_tab)", mode="i"},
--     ["<s-tab>"] = { "<Plug>(completion_smart_s_tab)", mode="i"},
--     ["<expr> <Tab>"] = { 'pumvisible() ? "<C-n>" : "<Tab>"', mode="i"},
--     ["<expr> <S-Tab>"] = { 'pumvisible() ? "<C-p>" : "<S-Tab>"', mode="i",}
-- })
wk.register({
  ["<leader>"] = { function() require('telescope.builtin').buffers() end, "Switch buffers"},
  ["<leader>h"] = { "<C-w>h", "Move left pane"},
  ["<leader>l"] = { "<C-w>l", "Move right pane"},
  ["<leader>j"] = { "<C-w>j", "Move down pane"},
  ["<leader>k"] = { "<C-w>k", "Move up pane"},
  ["s"] = { "<cmd> setlocal spell!", "Spellcheck"},
  ["w"] = { "<cmd>bd<CR>", "Close buffer"},
  ["q"] = { "<cmd>q<CR>", "Quit Nvim"},
  ['"'] = { '$F"ci"', 'Change in last "'},
  ["'"] = { '0ci"', 'Change in first "'},
  ["e"] = { function() vim.lsp.diagnostic.set_loclist() end, 'Open diagnostic quickfix list.'},
  ["n"] = { function() vim.lsp.diagnostic.goto_next() end, 'Move to next diagnostic item.'},
  ["H"] = { "<cmd>Header<CR>", "Create heading"},  
  f = {
    name = "File", -- optional group name
    f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false }, -- additional options for creating the keymap
    n = { "New File" }, -- just a label. don't create any mapping
    e = "Edit File", -- same as above
    ["1"] = "which_key_ignore",  -- special label to hide it in the popup
    b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
  },
  g = {
    name = "Git",
    s = { "<cmd>Git<CR>", "Status" },
    p = { "<cmd>Git -c push.default=current push<CR>", "Push" },
    P = { "<cmd>Git Pull<CR>", "Pull" },
    o = { function() require('telescope.builtin').git_files() end, "Open file from repo"},
    d = { "<cmd>Gvdiffsplit<CR>", "diff" }
  },
  p = {
    h = { "<cmd>ggI#!/usr/bin/env python3<CR>", "Add python shbang"},
    t = { "<cmd>w<CR><cmd>!tox<CR>", "Run Tox"},
    b = { "<cmd>!clear; python3 %<CR>", "Build"}
    }
}, { prefix = "<leader>" })
-- Legacy still to be converted to lua
-- load("mappings.vim")

-- U.noremap("n", "<leader>gs", "<cmd>Git status<CR>")
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
}


require'lspconfig'.pyright.setup{on_attach=require('completion').on_attach }
require'lspconfig'.vimls.setup{on_attach=require('completion').on_attach}
require'lspconfig'.denols.setup{on_attach=require('completion').on_attach}
require'lspconfig'.tsserver.setup{on_attach=require('completion').on_attach}
require'lspconfig'.gopls.setup{on_attach=require('completion').on_attach}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Enable underline, use default values
    underline = true,
    -- Enable virtual text, override spacing to 4
    virtual_text = {
      spacing = 4,
      prefix = '~',
    },
    -- Use a function to dynamically turn signs off
    -- and on, using buffer local variables
    signs = function(bufnr, client_id)
      local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, 'show_signs')
      -- No buffer local variable set, so just enable by default
      if not ok then
        return true
      end

      return result
    end,
    -- Disable a feature
    update_in_insert = false,
  }
)

G.startify_change_to_vcs_root = 1
G.startify_enable_special = 0
-- G.startify_custom_header = { 
-- 	'              ___________________________________________',
-- 	'             |               _  __                       |',
-- 	'             |              / |/ /_ __[ ]_ _             |',
-- 	'             |             /    / |/ / /  v \            |',
-- 	'             |____________/_/|_/|___/_/_/_/_/____________|',
-- }
--

Cmd([[
augroup MYAUTO
    autocmd BufEnter * lua require('completion').on_attach()
    autocmd BufWritePost init.lua source $MYVIMRC
    autocmd FileType *.python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
    autocmd BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType go setlocal ts=4 sts=4 sw=4 expandtab
    autocmd BufEnter *.template setlocal ts=2 sts=2 sw=2 syntax=json expandtab
    autocmd FileType .*{html,vue} setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType yaml,yml,json,py,sh autocmd BufWritePre <buffer> %s/\s\+$//e
augroup END
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END
]])
