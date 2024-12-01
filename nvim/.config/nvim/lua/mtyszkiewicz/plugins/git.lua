return {
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim", -- Diff integration
            "nvim-telescope/telescope.nvim",
        },
        version = "*",
        config = function()
            local neogit = require('neogit')
            neogit.setup({})

            vim.keymap.set("n", "<leader>pg", neogit.open)
        end
    },
    {
        'lewis6991/gitsigns.nvim',
        event = 'BufReadPre',
        opts = {
            -- see also: autocmds.lua
            -- this gets toggled off in insert mode
            -- and back on when leaving insert mode
            current_line_blame = true,
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol',
                delay = 100,
            },
            current_line_blame_formatter = '<author> • <author_time> • <summary>',
            on_attach = function()
                vim.cmd.redrawstatus()
            end,
        },
    },
    {
        'sindrets/diffview.nvim',
        cmd = {
            'DiffviewLog',
            'DiffviewOpen',
            'DiffviewClose',
            'DiffviewRefresh',
            'DiffviewFocusFiles',
            'DiffviewFileHistory',
            'DiffviewToggleFiles',
        },
        opts = {
            enhanced_diff_hl = true,
            view = {
                file_panel = {
                    win_config = {
                        position = 'right',
                    },
                },
            },
        },
    }
}
