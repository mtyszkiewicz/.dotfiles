return {
    'nvim-lualine/lualine.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- highlight! link StatusLineNC Normal
        vim.cmd [[
          highlight! link StatusLine Normal
        ]]
        -- Set transparent background
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
                lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
                lualine_b = { 'filename', 'branch', 'diff', 'diagnostics' },
                lualine_c = { '%=' },
                lualine_x = {},
                lualine_y = { 'filetype', 'progress' },
                lualine_z = {
                    { 'location', separator = { right = '' }, left_padding = 2 },
                },
            }
        })
    end,
}