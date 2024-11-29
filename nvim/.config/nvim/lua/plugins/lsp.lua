return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "folke/neodev.nvim",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            "jose-elias-alvarez/null-ls.nvim",
            "jay-babu/mason-null-ls.nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local lspconfig = require("lspconfig")
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")
            local mason_null_ls = require("mason-null-ls")
            local neodev = require("neodev")
            local null_ls = require("null-ls")
            local telescope_builtin = require("telescope.builtin")

            vim.api.nvim_create_autocmd(
                "LspAttach",
                {
                    callback = function(event)
                        local opts = { buffer = event.bufnr, remap = true }

                        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                        vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
                        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                        vim.keymap.set("n", "<leader>vrr", telescope_builtin.lsp_references, opts)
                        vim.keymap.set("n", "<leader>vws", telescope_builtin.lsp_dynamic_workspace_symbols, opts)
                        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                    end
                }
            )

            vim.api.nvim_create_autocmd(
                "BufWritePre",
                {
                    callback = function(event)
                        vim.lsp.buf.format({
                            async = false,
                            bufnr = event.bufnr,
                        })
                    end
                }
            )

            neodev.setup()
            mason.setup()
            mason_lspconfig.setup({
                ensure_installed = {
                    "bashls",
                    "gopls",
                    "jsonls",
                    "lua_ls",
                    "pyright",
                    "yamlls",
                },
                handlers = {
                    -- default handler
                    function(server)
                        lspconfig[server].setup({
                            capabilities = cmp_nvim_lsp.default_capabilities(),
                        })
                    end,
                },
            })

            mason_null_ls.setup({
                automatic_installation = true,
                ensure_installed = {
                    "autoflake",
                    "black",
                    "isort",
                },
            })

            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.autoflake,
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.isort,
                }
            })

            -- -- This function gets run when an LSP connects to a particular buffer.
            -- local on_attach = function(_, bufnr)
            --     -- Enable completion triggered by <c-x><c-o>
            --     vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
            --
            --     -- Mappings.
            --     -- See `:help vim.lsp.*` for documentation on any of the below functions
            --     local bufopts = { noremap = true, silent = true, buffer = bufnr }
            --     vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
            --     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
            --     vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
            --     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
            --     vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
            --     vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
            --     vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
            --     vim.keymap.set('n', '<space>wl', function()
            --         print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            --     end, bufopts)
            --     vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
            --     vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
            --     vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
            --     vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
            --     vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
            -- end
        end,
    },
}
