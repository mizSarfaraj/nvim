return {
    "theprimeagen/harpoon",
    config = function ()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "[A]dd [F]ile To Harpoon" })
        vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "[O]pen Harpoon Quick Menu" })

        vim.keymap.set("n", "<M-1>", function() ui.nav_file(1) end, { desc = '[N]avigate To File Number 1' })
        vim.keymap.set("n", "<M-2>", function() ui.nav_file(2) end, { desc = '[N]avigate To File Number 2' })
        vim.keymap.set("n", "<M-3>", function() ui.nav_file(3) end, { desc = '[N]avigate To File Number 3' })
        vim.keymap.set("n", "<M-4>", function() ui.nav_file(4) end, { desc = '[N]avigate To File Number 4' })
    end
}
