return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			-- "hrsh7th/cmp-buffer",
			-- "hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")

            -- local cmp_format = require('lsp-zero').cmp_format()

            cmp.setup({
                sources = {
                    {name = 'nvim_lsp'},
                    {name = 'buffer'},
                },
                --- (Optional) Show source name in completion menu
                -- formatting = cmp_format,
                mapping = cmp.mapping.preset.insert({
                    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                    ['<Enter>'] = cmp.mapping.confirm({ select = true }),

                    -- scroll up and down the documentation window
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                })
            })
        end,
    }
}