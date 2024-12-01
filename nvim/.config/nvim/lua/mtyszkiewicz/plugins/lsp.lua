return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "folke/neodev.nvim",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            "nvimtools/none-ls.nvim",
            "jay-babu/mason-null-ls.nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local lspconfig = require("lspconfig")
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")
            -- local mason_null_ls = require("mason-null-ls")
            local neodev = require("neodev")
            -- local null_ls = require("null-ls")
            local telescope_builtin = require("telescope.builtin")

            vim.api.nvim_create_autocmd(
                "LspAttach",
                {
                    callback = function(event)
                        local opts = { buffer = event.bufnr, remap = true }

                        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                        vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
                        vim.keymap.set("n", "<leader>vrr", telescope_builtin.lsp_references, opts)
                        vim.keymap.set("n", "<leader>vws", telescope_builtin.lsp_dynamic_workspace_symbols, opts)
                        vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
                        vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
                    end
                }
            )

            -- Format code before file write
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
                    "ruff",
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

            lspconfig.ruff.setup({
                init_options = {
                    lineLength = 100,

                    select = {
                        "E",  -- pycodestyle errors
                        "W",  -- pycodestyle warnings
                        "F",  -- pyflakes
                        "I",  -- isort
                        "UP", -- pyupgrade
                    },

                    ignore = {
                        "E501", -- Line too long (handled by line length setting)
                    },
                }
            })

            -- Better intellisense than ruff
            lspconfig.pyright = {
                settings = {
                    pyright = {
                        disableOrganizeImports = true, -- Using Ruff
                    },
                    python = {
                        analysis = {
                            ignore = { '*' },         -- Using Ruff
                            typeCheckingMode = 'off', -- Using mypy
                        },
                    },
                },
            }

            -- mason_null_ls.setup({
            --     automatic_installation = true,
            --     ensure_installed = {
            --         "autoflake",
            --         "black",
            --         "isort",
            --     },
            -- })
            --
            -- null_ls.setup({
            --     sources = {
            --         null_ls.builtins.formatting.autoflake,
            --         null_ls.builtins.formatting.black,
            --         null_ls.builtins.formatting.isort,
            --     }
            -- })
        end,
    },
}
