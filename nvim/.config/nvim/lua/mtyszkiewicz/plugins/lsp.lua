return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "folke/lazydev.nvim",   -- replaces neodev
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")
            local telescope_builtin = require("telescope.builtin")

            -- Wire up cmp capabilities globally for all servers
            vim.lsp.config("*", {
                capabilities = cmp_nvim_lsp.default_capabilities(),
            })

            -- LSP keymaps (unchanged, this part was fine)
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(event)
                    local opts = { buffer = event.bufnr, remap = true }
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "<leader>vrr", telescope_builtin.lsp_references, opts)
                    vim.keymap.set("n", "<leader>vws", telescope_builtin.lsp_dynamic_workspace_symbols, opts)
                    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
                    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
                end,
            })

            -- Format on save, skip C files (unchanged)
            vim.api.nvim_create_autocmd("BufWritePre", {
                callback = function(event)
                    if vim.bo.filetype ~= "c" then
                        vim.lsp.buf.format({ async = false, bufnr = event.bufnr })
                    end
                end,
            })

            -- Pyright config (was silently broken before — assigned table instead of calling setup)
            vim.lsp.config("pyright", {
                settings = {
                    pyright = {
                        disableOrganizeImports = true,
                    },
                    python = {
                        analysis = {
                            ignore = { "*" },
                            typeCheckingMode = "off",
                        },
                    },
                },
            })

            mason.setup()

            mason_lspconfig.setup({
                ensure_installed = {
                    "bashls",
                    "gopls",
                    "jsonls",
                    "lua_ls",
                    "pyright",
                    "yamlls",
                    "sqlls",
                    "clangd",
                },
            })

            -- Enable all servers (replaces the handlers default function)
            local servers = {
                "bashls", "gopls", "jsonls", "lua_ls",
                "pyright", "yamlls", "sqlls", "clangd",
            }
            for _, server in ipairs(servers) do
                vim.lsp.enable(server)
            end
        end,
    },
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
}