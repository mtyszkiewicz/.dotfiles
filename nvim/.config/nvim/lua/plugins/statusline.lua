return {
    -- { 'beauwilliams/statusline.lua' }
    'nvim-lualine/lualine.nvim',
    event = 'ColorScheme',
    config = function()
        require('lualine').setup({
            options = {
                theme = 'rose-pine'
            }
        })
    end
}
