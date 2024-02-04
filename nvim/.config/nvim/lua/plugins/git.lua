return {
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",        -- Diff integration
            "nvim-telescope/telescope.nvim",
        },
        config = function ()
            local neogit = require('neogit')

            neogit.setup({})

            vim.keymap.set("n", "<leader>pg", neogit.open)
        end
    }
}
