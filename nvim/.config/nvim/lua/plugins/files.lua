return {
    {
        'echasnovski/mini.files',
        version = false,
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function ()
            local minifiles = require("mini.files")

            minifiles.setup({
                content = {
                    prefix = function() end,
                },
                windows = {
                    preview = true,
                    width_preview = 80,
                }
            })

            vim.keymap.set("n", "<leader>pv", function()
                if not minifiles.close() then
                    minifiles.open(vim.api.nvim_buf_get_name(0))
                end
            end)
        end,
    },
}
