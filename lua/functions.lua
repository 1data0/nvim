-- ::::::::::::::::::::::::::::::( Functions ):::::::::::::::::::::::::::::::::
local U = require('utils')
function _G.test1()
    local job = Job:new({
    command = 'echo',
    args = { 'hi' },
    on_stdout = function(j, results)
        print(results)
    end,
    }):sync()
end



-- Legacy still to be converted to lua
U.load("functions.vim")
-- load("autocommands.vim")


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
  if U.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif U.fn['vsnip#available'](1) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return U.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if U.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif U.fn['vsnip#jumpable'](-1) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end


local fzf = require("fzf")
fzf_t = function()
    coroutine.wrap(function()
      local result = fzf.fzf({"echo hello", "pavucontrol"})
      if result then
        vim.fn.system(result[1])
      end
    end)()
end
-- call fzf#run({'source': 'git ls-files', 'sink': 'e'})


-- -- " plugin/whid.vim
-- -- if exists('g:loaded_whid') | finish | endif

-- -- let s:save_cpo = &cpo
-- -- set cpo&vim

-- -- hi def link WhidHeader      Number
-- -- hi def link WhidSubHeader   Identifier

-- -- command! Whid lua require'whid'.whid()

-- -- let &cpo = s:save_cpo
-- -- unlet s:save_cpo

-- -- let g:loaded_whid = 1

-- -- lua/whid.lua
-- local api = vim.api
-- local buf, win
-- local position = 0

-- local function center(str)
--   local width = api.nvim_win_get_width(0)
--   local shift = math.floor(width / 2) - math.floor(string.len(str) / 2)
--   return string.rep(' ', shift) .. str
-- end

-- local function open_window()
--   buf = api.nvim_create_buf(false, true)
--   local border_buf = api.nvim_create_buf(false, true)

--   api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
--   api.nvim_buf_set_option(buf, 'filetype', 'whid')

--   local width = api.nvim_get_option("columns")
--   local height = api.nvim_get_option("lines")

--   local win_height = math.ceil(height * 0.8 - 4)
--   local win_width = math.ceil(width * 0.8)
--   local row = math.ceil((height - win_height) / 2 - 1)
--   local col = math.ceil((width - win_width) / 2)

--   local border_opts = {
--     style = "minimal",
--     relative = "editor",
--     width = win_width + 2,
--     height = win_height + 2,
--     row = row - 1,
--     col = col - 1
--   }

--   local opts = {
--     style = "minimal",
--     relative = "editor",
--     width = win_width,
--     height = win_height,
--     row = row,
--     col = col
--   }

--   local border_lines = { '╔' .. string.rep('═', win_width) .. '╗' }
--   local middle_line = '║' .. string.rep(' ', win_width) .. '║'
--   for i=1, win_height do
--     table.insert(border_lines, middle_line)
--   end
--   table.insert(border_lines, '╚' .. string.rep('═', win_width) .. '╝')
--   api.nvim_buf_set_lines(border_buf, 0, -1, false, border_lines)

--   local border_win = api.nvim_open_win(border_buf, true, border_opts)
--   win = api.nvim_open_win(buf, true, opts)
--   api.nvim_command('au BufWipeout <buffer> exe "silent bwipeout! "'..border_buf)

--   api.nvim_win_set_option(win, 'cursorline', true) -- it highlight line with the cursor on it

--   -- we can add title already here, because first line will never change
--   api.nvim_buf_set_lines(buf, 0, -1, false, { center('What have i done?'), '', ''})
--   api.nvim_buf_add_highlight(buf, -1, 'WhidHeader', 0, 0, -1)
-- end

-- local function update_view(direction)
--   api.nvim_buf_set_option(buf, 'modifiable', true)
--   position = position + direction
--   if position < 0 then position = 0 end

--   local result = vim.fn.systemlist('git diff-tree --no-commit-id --name-only -r  HEAD~'..position)
--   if #result == 0 then table.insert(result, '') end -- add  an empty line to preserve layout if there is no results
--   for k,v in pairs(result) do
--     result[k] = '  '..result[k]
--   end

--   api.nvim_buf_set_lines(buf, 1, 2, false, {center('HEAD~'..position)})
--   api.nvim_buf_set_lines(buf, 3, -1, false, result)

--   api.nvim_buf_add_highlight(buf, -1, 'whidSubHeader', 1, 0, -1)
--   api.nvim_buf_set_option(buf, 'modifiable', false)
-- end

-- local function close_window()
--   api.nvim_win_close(win, true)
-- end

-- local function open_file()
--   local str = api.nvim_get_current_line()
--   close_window()
--   api.nvim_command('edit '..str)
-- end

-- local function move_cursor()
--   local new_pos = math.max(4, api.nvim_win_get_cursor(win)[1] - 1)
--   api.nvim_win_set_cursor(win, {new_pos, 0})
-- end

-- local function set_mappings()
--   local mappings = {
--     ['['] = 'update_view(-1)',
--     [']'] = 'update_view(1)',
--     ['<cr>'] = 'open_file()',
--     h = 'update_view(-1)',
--     l = 'update_view(1)',
--     q = 'close_window()',
--     k = 'move_cursor()'
--   }

--   for k,v in pairs(mappings) do
--     api.nvim_buf_set_keymap(buf, 'n', k, ':lua require"whid".'..v..'<cr>', {
--         nowait = true, noremap = true, silent = true
--       })
--   end
--   local other_chars = {
--     'a', 'b', 'c', 'd', 'e', 'f', 'g', 'i', 'n', 'o', 'p', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
--   }
--   for k,v in ipairs(other_chars) do
--     api.nvim_buf_set_keymap(buf, 'n', v, '', { nowait = true, noremap = true, silent = true })
--     api.nvim_buf_set_keymap(buf, 'n', v:upper(), '', { nowait = true, noremap = true, silent = true })
--     api.nvim_buf_set_keymap(buf, 'n',  '<c-'..v..'>', '', { nowait = true, noremap = true, silent = true })
--   end
-- end

-- local function whid()
--   position = 0
--   open_window()
--   set_mappings()
--   update_view(0)
--   api.nvim_win_set_cursor(win, {4, 0})
-- end

-- return {
--   whid = whid,
--   update_view = update_view,
--   open_file = open_file,
--   move_cursor = move_cursor,
--   close_window = close_window
-- }
