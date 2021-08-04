--::::::::::::::::::::::::::::::::( Mappings ):::::::::::::::::::::::::::::::::
local U = require('utils')
local F = require('functions')
local wk = require("which-key")

U.g.mapleader = ' '
U.g.maplocalleader = ','

wk.register({
    ["<leader>"] = {
        function()
            require('telescope.builtin').buffers()
        end,
        "Switch buffers"
    },
    ["<leader>h"] = {
        "<C-w>h",
        "Move left pane"
    },
    ["<leader>l"] = {
        "<C-w>l",
        "Move right pane"
    },
    ["<leader>j"] = {
        "<C-w>j",
        "Move down pane"
    },
    ["<leader>k"] = {
        "<C-w>k",
        "Move up pane"
    },
    ["s"] = {
        "<cmd> setlocal spell!<CR>",
        "Spellcheck"
    },
    ["w"] = {
        "<cmd>bd<CR>",
        "Close buffer"
    },
    ["q"] = {
        "<cmd>q<CR>",
        "Quit Nvim"
    },
    ['"'] = {
        '$F"ci"',
        'Change in last "'
    },
    ["'"] = {
        '0ci"',
        'Change in first "'
    },
    ["J"] = {
        "<cmd>m '>+1<CR>gv=gv>",
        'Change in first "', mode = "v"
    },
    ["t"] = {
        _G.test1,
        'lua test"'
    },
    ["tt"] = {
        function()
            fzf_t()
        end,
        'lua test"'
    },
    ["e"] = {
        function()
            vim.lsp.diagnostic.set_loclist()
        end,
        'Open diagnostic quickfix list.'
    },
    ["n"] = {
        function()
            vim.lsp.diagnostic.goto_next()
        end,
        'Move to next diagnostic item.'
    },
    ["h"] = {
        "<cmd>header<cr>",
        "create heading"
    },
    ["c"] = {
        "<cmd>e ~/.config/nvim/init.lua<cr>",
        "Edit config"
    },
    f = {
        name = "File", -- optional group name
        f = {
            "<cmd>Telescope find_files<cr>",
            "Find File" 
        },
        r = {
            "<cmd>Telescope oldfiles<cr>",
            "Open Recent File",
            noremap=false
        },
        n = {
            "New File"
        }, -- just a label. don't create any mapping
        e = "Edit File", -- same as above
        ["1"] = "which_key_ignore",  -- special label to hide it in the popup
        b = {
            function()
                print("bar")
            end,
            "Foobar"
        } -- you can also pass functions!
    },
    g = {
        name = "Git",
        s = {
            "<cmd>Git<CR>",
            "Status"
        },
        p = {
            "<cmd>Git -c push.default=current push<CR>",
            "Push"
        },
        P = {
            "<cmd>Git pull<CR>",
            "Pull"
        },
        o = {
            function()
                require('telescope.builtin').git_files()
            end,
            "Open file from repo"
        },
        d = {
            "<cmd>Gvdiffsplit<CR>",
            "diff"
        },
        r = {
            "<cmd>!$(echo \"git branch --set-upstream-to=origin/$(git branch --show-current) $(git branch --show-current)\") && git pull<CR>",
            "Set remote"
        },
        m = {
            "<cmd>split | resize 20 | term mr<CR>",
            "Get Merge Request"
        },

    },
    p = {
        h = {
            "<cmd>ggI#!/usr/bin/env python3<CR>",
            "Add python shbang"
        },
        t = {
            "<cmd>w<CR><cmd>!tox<CR>",
            "Run Tox"
        },
        b = {
            "<cmd>!clear; python3 %<CR>",
            "Build"
        }
    }
},
{ prefix = "<leader>" })


U.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
U.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
U.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
U.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
