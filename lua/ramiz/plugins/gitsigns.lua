return {
    'lewis6991/gitsigns.nvim',
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require('gitsigns').setup {
            signs = {
                add = { text = '│' },
                change = { text = '│' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
                untracked = { text = '┆' },
            },
            signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
            numhl = false,     -- Toggle with `:Gitsigns toggle_numhl`
            linehl = false,    -- Toggle with `:Gitsigns toggle_linehl`
            word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir = {
                follow_files = true
            },
            attach_to_untracked = true,
            current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 300,
                ignore_whitespace = false,
            },
            current_line_blame_formatter = '   <author>, <author_time:%Y-%m-%d> - <summary>',
            sign_priority = 6,
            update_debounce = 100,
            status_formatter = nil,  -- Use default
            max_file_length = 40000, -- Disable if file is longer than this (in lines)
            preview_config = {
                -- Options passed to nvim_open_win
                border = 'single',
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1
            },
            yadm = {
                enable = false
            },
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns
                local keymap = vim.keymap.set
                local opts = { buffer = bufnr }

                function spread(options, new_opts)
                    local table = {}
                    for key, value in pairs(options) do
                        table[key] = value
                    end
                    for key, value in pairs(new_opts) do
                        table[key] = value
                    end
                    return table
                end

                -- Navigation
                vim.keymap.set('n', ']c', function()
                    if vim.wo.diff then return ']c' end
                    vim.schedule(function() gs.next_hunk() end)
                    return '<Ignore>'
                end, { expr = true })

                vim.keymap.set('n', '[c', function()
                    if vim.wo.diff then return '[c' end
                    vim.schedule(function() gs.prev_hunk() end)
                    return '<Ignore>'
                end, { expr = true })

                -- Actions
                keymap('n', '<leader>hs', gs.stage_hunk, spread(opts, { desc = "Stage Hunk" }))
                keymap('n', '<leader>hr', gs.reset_hunk, spread(opts, { desc = "Reset Hunk" }))
                keymap('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
                    spread(opts, { desc = "Stage Hunk (visual line mode)" }))
                keymap('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
                    spread(opts, { desc = "Reset Hunk (visual line mode)" }))
                keymap('n', '<leader>hS', gs.stage_buffer, spread(opts, { desc = 'Stage Buffer' }))
                keymap('n', '<leader>hu', gs.undo_stage_hunk, spread(opts, { desc = 'Unstage Hunk' }))
                keymap('n', '<leader>hR', gs.reset_buffer, spread(opts, { desc = 'Reset Buffer' }))
                keymap('n', '<leader>hp', gs.preview_hunk, spread(opts, { desc = 'Preview Hunk' }))
                keymap('n', '<leader>hb', function() gs.blame_line { full = true } end,
                    spread(opts, { desc = 'Blames line' }))
                keymap('n', '<leader>tb', gs.toggle_current_line_blame,
                    spread(opts, { desc = 'Toggle current blame line' }))
                keymap('n', '<leader>hd', gs.diffthis, spread(opts, { desc = 'Open in diff view' }))
                -- keymap('n', '<leader>hD', function() gs.diffthis('~') end, opts, { desc = '' })
                -- keymap('n', '<leader>td', gs.toggle_deleted, opts, { desc = '' })

                -- Text object
                vim.keymap.set({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
            end
        }
    end
}
