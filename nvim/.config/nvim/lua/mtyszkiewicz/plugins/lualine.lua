return {
    'nvim-lualine/lualine.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local status_ok, lualine = pcall(require, "lualine")
        if not status_ok then
            return
        end

        -- highlight! link StatusLineNC Normal
        vim.cmd("highlight! link StatusLine Normal")

        -- Set transparent background
        local auto_theme = require('lualine.themes.auto')
        auto_theme.normal.c.bg = 'none'
        auto_theme.insert.c.bg = 'none'
        auto_theme.visual.c.bg = 'none'
        auto_theme.replace.c.bg = 'none'
        auto_theme.command.c.bg = 'none'
        auto_theme.inactive.c.bg = 'none'

        local hide_in_width = function()
            return vim.fn.winwidth(0) > 80
        end

        local mode = {
            "mode",
            separator = { left = "" },
            right_padding = 2,
        }

        local diagnostics = {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn" },
            symbols = { error = " ", warn = " " },
            colored = false,
            always_visible = true,
        }

        local diff = {
            "diff",
            colored = false,
            symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
            cond = hide_in_width,
        }

        local filetype = {
            "filetype",
            icons_enabled = false,
        }

        local location = {
            "location",
            padding = 0,
            left_padding = 2,
            separator = { right = "" },
        }

        lualine.setup {
            options = {
                globalstatus = true,
                icons_enabled = true,
                theme = "auto",
                section_separators = { left = "", right = "" },
                disabled_filetypes = { "alpha", "dashboard" },
                always_divide_middle = true,
            },
            sections = {
                lualine_a = { mode },
                lualine_b = { "branch" },
                lualine_c = { diagnostics },
                lualine_x = { diff, "encoding", filetype },
                lualine_y = { "progress" },
                lualine_z = { location },
            },
        }
    end,
}
