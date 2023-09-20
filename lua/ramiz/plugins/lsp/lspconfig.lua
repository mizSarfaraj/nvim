return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        -- import lspconfig plugin
        local lspconfig = require("lspconfig")

        -- import cmp-nvim-lsp plugin
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local keymap = vim.keymap -- for conciseness

        -- local opts = { noremap = true, silent = true }
        local on_attach = function(client, bufnr)
            local opts = { buffer = bufnr, remap = false }

            keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts, { desc = "Go To Definition" })
            keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts, { desc = "Hover Menu (LSP)" })
            keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts,
                { desc = "Find Worksplace Symbol" })
            keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts, { desc = "" })
            keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts, { desc = "" })
            keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts, { desc = "" })
            keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts, { desc = "" })
            keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts, { desc = "" })
            keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts, { desc = "" })
            keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts, { desc = "" })
            -- keymap.set('n', '<S-M-f>', vim.cmd.LspZeroFormat, opts, { desc = "[F]ormat File" })
            keymap.set('n', '<leader>lr', function() require('telescope.builtin').lsp_references() end,
                { noremap = true, silent = true, desc = "Find References in Telescope" })
            keymap.set('n', '<M-S-f>', function()
                vim.lsp.buf.format()
                print("Formatted")
            end, { desc = "Format Buffer" })
        end

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Change the Diagnostic symbols in the sign column (gutter)
        -- (not in youtube nvim video)
        -- local signs = { Error = "¿ ", Warn = "¿ ", Hint = "¿ ", Info = "¿ " }
        -- for type, icon in pairs(signs) do
        -- local hl = "DiagnosticSign" .. type
        -- vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        -- end

        -- configure html server
        lspconfig["html"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure typescript server with plugin
        lspconfig["tsserver"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure css server
        lspconfig["cssls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure emmet language server
        lspconfig["emmet_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
        })

        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = { -- custom settings for lua
                Lua = {
                    -- make the language server recognize "vim" global
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        -- make language server aware of runtime files
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })
    end,
}
