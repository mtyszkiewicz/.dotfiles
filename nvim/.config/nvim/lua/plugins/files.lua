return {
    {
        'echasnovski/mini.files',
        version = false,
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            local minifiles = require("mini.files")

            minifiles.setup({
                content = {
                    filter = function(entry)
                        return (
                            entry.name ~= '.DS_Store'
                            and entry.name ~= '.git'
                            and entry.name ~= '.direnv'
                            and entry.name ~= '__pycache__'
                            and entry.name ~= '.pytest_cache'
                            and entry.name ~= '.vscode'
                            and entry.name ~= '.idea'
                            and entry.name ~= '.venv'
                        )
                    end,
                    prefix = function() end,
                },
                windows = {
                    preview = true,
                    width_focus = 50,
                    width_nofocus = 15,
                    width_preview = 60,
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
