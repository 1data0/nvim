-- ::::::::::::::::::::::::::::::( Plug Conf ):::::::::::::::::::::::::::::::::
--
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
    vsnip = false;
    ultisnips = true;
    luasnip = true;
  };
}

U.g.startify_change_to_vcs_root = 1
U.g.startify_enable_special = 0
-- Cmd('g.startify_custom_header = [
-- 	\'              ___________________________________________',
-- 	\'             |               _  __                       |',
-- 	\'             |              / |/ /_ __[ ]_ _             |',
-- 	\'             |             /    / |/ / /  v \            |',
-- 	\'             |____________/_/|_/|___/_/_/_/_/____________|',
-- 	]
-- ')
