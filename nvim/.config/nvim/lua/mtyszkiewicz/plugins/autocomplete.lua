return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            -- https://www.nerdfonts.com/cheat-sheet
            local icons = {
                Text = "󰦨",
                Method = "󰷼",
                Function = "󰊕",
                Constructor = "",
                Field = "",
                Variable = "",
                Class = "󰠱",
                Interface = "",
                Module = "󰏗",
                Property = "󰜢",
                Unit = "󰊱",
                Value = "󰎠",
                Enum = "󰦪",
                Keyword = "󰌋",
                Snippet = "",
                Color = "󰏘",
                File = "󰈔",
                Reference = "",
                Folder = "󰉋",
                EnumMember = "󰦾",
                Constant = "󰏿",
                Struct = "󰙅",
                Event = "",
                Operator = "󰆕",
                TypeParameter = "󰊄"
            }

            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                }),

                mapping = cmp.mapping.preset.insert({
                    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                    ['<C-k>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-e>'] = cmp.mapping.abort(),
                }),

                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end
                },

                formatting = {
                    expandable_indicator = true,
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, vim_item)
                        vim_item.kind = string.format("%s", icons[vim_item.kind])
                        vim_item.menu = ({
                            nvim_lsp = "[LSP]",
                            luasnip = "[Snippet]",
                            buffer = "[Buffer]",
                            path = "[Path]",
                        })[entry.source.name]
                        return vim_item
                    end,
                },
                window = {
                    documentation = {
                        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
                    },
                },
            })
        end,
    },
    {
        'echasnovski/mini.pairs'
    },
}
