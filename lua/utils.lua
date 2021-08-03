return {
    g = vim.g,
    c = vim.cmd,
    o = vim.opt,
    ol = vim.opt_local,
    fn = vim.fn,
    api = vim.api,
    job = require('plenary.job'),
    home = os.getenv('HOME'),
    cfg = os.getenv('HOME') .. '/.config/nvim/',
    load = function(file) 
        vim.cmd("source " .. os.getenv('HOME') .. '/.config/nvim/' .. file) 
    end,
    colorscheme = function(name) vim.cmd('colorscheme ' .. name) end
}
