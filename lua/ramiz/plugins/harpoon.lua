return {
    "theprimeagen/harpoon",
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Add File To Harpoon" })
        vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Open Harpoon Quick Menu" })

        vim.keymap.set("n", "<M-l>", function() ui.nav_next() end, { desc = "Go To Harpoon Next Mark" })
        vim.keymap.set("n", "<M-h>", function() ui.nav_prev() end, { desc = "Go To Harpoon Previous Mark" })

        vim.keymap.set("n", "<M-1>", function() ui.nav_file(1) end, { desc = 'Navigate To Harpoon File Number 1' })
        vim.keymap.set("n", "<M-2>", function() ui.nav_file(2) end, { desc = 'Navigate To Harpoon File Number 2' })
        vim.keymap.set("n", "<M-3>", function() ui.nav_file(3) end, { desc = 'Navigate To Harpoon File Number 3' })
        vim.keymap.set("n", "<M-4>", function() ui.nav_file(4) end, { desc = 'Navigate To Harpoon File Number 4' })
        vim.keymap.set("n", "<M-5>", function() ui.nav_file(5) end, { desc = 'Navigate To Harpoon File Number 4' })
    end
}
