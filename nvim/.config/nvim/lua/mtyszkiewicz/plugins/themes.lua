return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            require('gruvbox').setup()
            vim.cmd.colorscheme "gruvbox"
        end
    },
    -- {
    --     "Mofiqul/vscode.nvim",
    --     priority = 1000,
    --     config = function()
    --         require("vscode").setup()
    --         vim.cmd.colorscheme "vscode"
    --     end
    -- }
}
