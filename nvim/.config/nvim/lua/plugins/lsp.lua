return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "folke/neodev.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim"
        },
        config = function()
            -- Set up Mason before anything else
            require("mason").setup()




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

            require("neodev").setup()

            local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
            local default_setup = function(server)
                require('lspconfig')[server].setup({
                    capabilities = lsp_capabilities,
                })
            end

            require('mason-lspconfig').setup({
                ensure_installed = {
                    'bashls',
                    'gopls',
                    'jsonls',
                    'lua_ls',
                    'ruff_lsp',
                    'tsserver',
                    'yamlls',
                    'sqlls'
                },
                handlers = {
                    default_setup,
                },
            })

            -- This function gets run when an LSP connects to a particular buffer.
            local on_attach = function(_, bufnr)
                -- Enable completion triggered by <c-x><c-o>
                vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

                -- Mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local bufopts = { noremap = true, silent = true, buffer = bufnr }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
                vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
                vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
                vim.keymap.set('n', '<space>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, bufopts)
                vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
                vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
                vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
                vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
            end

            local lspconfig = require('lspconfig')

            lspconfig.lua_ls.setup({
                on_attach = on_attach,
                capabilities = lsp_capabilities,
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = "Replace",
                        },
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.stdpath("config") .. "/lua"] = true,
                            },
                        },
                    }
                }
            })

            lspconfig.ruff_lsp.setup {
                on_attach = on_attach,
                init_options = {
                    settings = {
                        -- Any extra CLI arguments for `ruff` go here.
                        args = {},
                    }
                }
            }

            lspconfig.sqlls.setup({
                cmd = { "sql-language-server", "up", "--method", "stdio" },
                filetypes = { "sql" }
            })
        end,
    },
}
