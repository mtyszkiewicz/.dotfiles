return {
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
}
