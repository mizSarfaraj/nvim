return {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<leader>gg", mode = {"n", "v"}, vim.cmd.LazyGit,  {desc = "Open Lazygit"}}
    }
}
