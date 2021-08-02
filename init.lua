local O = vim.opt
local OL = vim.opt_local
local G = vim.g
local Cmd = vim.cmd
local Fn = vim.fn
local Api = vim.api
local U = {}
local Job = require('plenary.job')

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

function _G.test1()
    local job = Job:new({
    command = 'echo',
    args = { 'hi' },
    on_stdout = function(j, results)
        print(results)
    end,
    }):sync()
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
O.undodir = '.config/vim-persisted-undo/'
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
-- O.rtp:append { '~/.config/nvim/plugged/fzf' }
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

-- local function escape_seq(str)
--     -- Adjust boolean arguments as needed
--     return vim.api.nvim_replace_termcodes(str, true, true, true)
-- end

-- function _G.smart_tab()
--     return vim.fn.pumvisible() == 1 and escape_seq('<C-n>') or escape_seq('<Tab>')
-- end

-- function _G.s_smart_tab()
--     return vim.fn.pumvisible() == 1 and escape_seq('<C-n>') or escape_seq('<S-Tab>')
-- end

-- completion-nvim mappings
-- Cmd('imap <tab> <Plug>(completion_smart_tab)')
-- Cmd('imap <s-tab> <Plug>(completion_smart_s_tab)')
-- Cmd 'inoremap <expr> <C-j> pumvisible() ? "\\<C-n>" : "\\<C-j>"'
-- Cmd 'inoremap <expr> <C-k> pumvisible() ? "\\<C-p>" : "\\<C-k>"'
-- Cmd('inoremap <expr> <Tab>   pumvisible() ? "<C-n>" : "<Tab>"')
-- Cmd('inoremap <expr> <S-Tab> pumvisible() ? "<C-p>" : "<S-Tab>"')
local wk = require("which-key")
-- wk.register({
--     ["<tab>"] = { "<Plug>(completion_smart_tab)", mode="i"},
--     ["<s-tab>"] = { "<Plug>(completion_smart_s_tab)", mode="i"},
--     ["<Tab>"] = { _G.smart_tab, mode="i", expr=true},
--     ["<S-Tab>"] = { _G.s_smart_tab, mode="i", expr=true}
-- })
wk.register({
  ["<leader>"] = { function() require('telescope.builtin').buffers() end, "Switch buffers"},
  ["<leader>h"] = { "<C-w>h", "Move left pane"},
  ["<leader>l"] = { "<C-w>l", "Move right pane"},
  ["<leader>j"] = { "<C-w>j", "Move down pane"},
  ["<leader>k"] = { "<C-w>k", "Move up pane"},
  ["s"] = { "<cmd> setlocal spell!<CR>", "Spellcheck"},
  ["w"] = { "<cmd>bd<CR>", "Close buffer"},
  ["q"] = { "<cmd>q<CR>", "Quit Nvim"},
  ['"'] = { '$F"ci"', 'Change in last "'},
  ["'"] = { '0ci"', 'Change in first "'},
  ["J"] = { "<cmd>m '>+1<CR>gv=gv>", 'Change in first "', mode = "v"},
  ["t"] = { _G.test1, 'lua test"'},
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
    P = { "<cmd>Git pull<CR>", "Pull" },
    o = { function() require('telescope.builtin').git_files() end, "Open file from repo"},
    d = { "<cmd>Gvdiffsplit<CR>", "Diff" },
    r = { "<cmd>!$(echo \"git branch --set-upstream-to=origin/$(git branch --show-current) $(git branch --show-current)\") && git pull<CR>", "Set remote" }
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

require'lspconfig'.pyright.setup{on_attach=require('compe').on_attach }
require'lspconfig'.vimls.setup{on_attach=require('compe').on_attach}
require'lspconfig'.denols.setup{on_attach=require('compe').on_attach}
require'lspconfig'.tsserver.setup{on_attach=require('compe').on_attach}
require'lspconfig'.gopls.setup{on_attach=require('compe').on_attach}

require'lspconfig'.pyright.setup({
    before_init = function(_, config)
        config.settings.python.pythonPath = {"../../"}
    end
})

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

require('compe').setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
    luasnip = true;
  };
}
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn['vsnip#available'](1) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn['vsnip#jumpable'](-1) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

Api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
Api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
Api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
Api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

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
