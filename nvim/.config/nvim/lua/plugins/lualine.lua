return {
    'nvim-lualine/lualine.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- make c section background transparent
        local auto_theme = require('lualine.themes.auto')
        auto_theme.normal.c.bg = 'none'
        auto_theme.insert.c.bg = 'none'
        auto_theme.visual.c.bg = 'none'
        auto_theme.replace.c.bg = 'none'
        auto_theme.command.c.bg = 'none'
        auto_theme.inactive.c.bg = 'none'

        require('lualine').setup({
            options = {
                section_separators = { left = '', right = '' },
                component_separators = {},
                always_divide_middle = true,
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'filename', 'branch', 'diff', 'diagnostics' },
                lualine_c = { '%=' },
                lualine_x = {},
                lualine_y = { 'filetype', 'progress' },
                lualine_z = { 'location' },
            }
        })
    end,
}
