return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        local bufferline = require('bufferline')

        bufferline.setup({
            highlights = {
                fill = {
                    fg = 'NONE',
                    bg = 'NONE',
                },
                background = {
                    fg = 'NONE',
                    bg = 'NONE',
                }
            }
        })

        vim.keymap.set('n', '<Tab>', function() bufferline.cycle(1) end)
        vim.keymap.set('n', '<S-Tab>', function() bufferline.cycle(-1) end)
    end
}
