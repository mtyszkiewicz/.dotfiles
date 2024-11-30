return {
    { 'nvim-tree/nvim-web-devicons', opts = { variant = 'dark' } },
    {
        'echasnovski/mini.files',
        version = '*',
        priority = 1000,
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            local minifiles = require("mini.files")
            local window_width = vim.fn.winwidth(0)
            local width_preview = 60

            if window_width > 200 then
                width_preview = 120
            end

            minifiles.setup({
                windows = {
                    preview = true,
                    width_focus = 50,
                    width_nofocus = 15,
                    width_preview = width_preview,
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
