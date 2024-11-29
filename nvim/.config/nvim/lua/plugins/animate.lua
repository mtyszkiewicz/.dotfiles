return {
    {
        'echasnovski/mini.animate',
        event = 'VeryLazy',
        version = '*',
        config = function()
            local minianimate = require("mini.animate")

            minianimate.setup({
                resize = {
                    enable = false
                },
                open = {
                    enable = false
                },
                close = {
                    enable = false
                },
                cursor = {
                    enable = false
                },
                scroll = {
                    enable = true,
                    timing = minianimate.gen_timing.linear({ duration = 100, unit = 'total' }),
                },
            })
        end
    }
}
