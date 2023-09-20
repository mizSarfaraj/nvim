return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
        local catppuccin = require("lualine.themes.catppuccin")
        require("lualine").setup({
            options = {
                theme = catppuccin
            }
        })
    end
}
