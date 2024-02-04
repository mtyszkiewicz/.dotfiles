return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "WhoIsSethDaniel/mason-tool-installer.nvim"
        },
        config = function()
            -- Set up Mason before anything else
            require("mason").setup()

            local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
            local default_setup = function(server)
                require('lspconfig')[server].setup({
                    capabilities = lsp_capabilities,
                })
            end -- This end closes the default_setup function

            require('mason-lspconfig').setup({
                ensure_installed = {
                    'bashls',
                    'gopls',
                    'jsonls',
                    'lua_ls',
                    'pyright',
                    'tsserver',
                    'yamlls',
                },
                handlers = {
                    default_setup,
                },
            })

            -- Special setup for lua_ls
            require('lspconfig').lua_ls.setup({
                capabilities = lsp_capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            })

            require('mason-tool-installer').setup({
                ensure_installed = {
                    'black',
                    'isort',
                },
            })
        end,
    },
}
