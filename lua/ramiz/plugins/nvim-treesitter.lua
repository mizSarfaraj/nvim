return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            'HiPhish/nvim-ts-rainbow2',
        },
        event = { "BufReadPre", "BufNewFile" },
        init = function()
           local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
           ts_update()
        end,
        config = function ()
            require 'nvim-treesitter.configs'.setup {
                -- A list of parser names, or "all"
                ensure_installed = { "javascript", "lua", "php", "html" },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                rainbow = {
                    enable = true,
                    query = 'rainbow-parens',
                    strategy = require('ts-rainbow').strategy.global,
                }
            }
       end
    }
}
