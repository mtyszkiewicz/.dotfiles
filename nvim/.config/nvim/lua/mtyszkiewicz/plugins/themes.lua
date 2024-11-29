return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            require('gruvbox').setup()
            vim.cmd("colorscheme gruvbox")

            local transparent_elements = {
                "Normal",
                "NormalNC",
                "NormalFloat",
                "FloatBorder",
                "LineNr",
                "Folded",
                "NonText",
                "SpecialKey",
                "VertSplit",
                "SignColumn",
                "EndOfBuffer",
                -- "CursorLine",
                "WinSeparator",
            }
            for _, elem in pairs(transparent_elements) do
                vim.cmd("hi " .. elem .. " guibg=NONE ctermbg=NONE")
            end
        end
    },
    -- {
    --     'gmr458/vscode_modern_theme.nvim',
    --     lazy = false,
    --     priority = 1000,
    --     opts = {
    --         cursorline = true,
    --         transparent_background = false,
    --         nvim_tree_darker = true,
    --         italic_keyword = false,
    --         custom_dark_background = '#111111',
    --         custom_statusline_dark_background = '#080808',
    --     },
    --     config = function(_, opts)
    --         require('vscode_modern').setup(opts)
    --         vim.cmd.colorscheme('vscode_modern')
    --
    --         local transparent_elements = {
    --             "Normal",
    --             "NormalNC",
    --             "NormalFloat",
    --             "FloatBorder",
    --             "LineNr",
    --             "Folded",
    --             "NonText",
    --             "SpecialKey",
    --             "VertSplit",
    --             "SignColumn",
    --             "EndOfBuffer",
    --             -- "CursorLine",
    --             "WinSeparator",
    --         }
    --         for _, elem in pairs(transparent_elements) do
    --             vim.cmd("hi " .. elem .. " guibg=NONE ctermbg=NONE")
    --         end
    --     end
    -- }
}
