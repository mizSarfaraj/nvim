return {
    'romgrk/barbar.nvim',
    dependencies = {
        'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    config = function ()
        vim.keymap.set("n", '<Tab>', vim.cmd.BufferNext, { desc = 'Go To Next Buffer' })
        vim.keymap.set("n", '<S-Tab>', vim.cmd.BufferPrevious, { desc = 'Go To Next Buffer' })

        vim.keymap.set('n', '<A-<>', vim.cmd.BufferMovePrevious, { desc = "Move the buffer to left" })
        vim.keymap.set('n', '<A->>', vim.cmd.BufferMoveNext, { desc = "Move the buffer to rightt" })

        vim.keymap.set('n', '<leader>bp', vim.cmd.BufferPick, { desc = "Pick From Buffer" })
        vim.keymap.set('n', '<C-w>', vim.cmd.BufferClose, { desc = "Close the current Buffer" })

        vim.keymap.set('n', '<leader>to', vim.cmd.BufferCloseAllButCurrentOrPinned, { desc = "Close buffers except current and pinned ones" })
    end
}
