return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'echasnovski/mini.files'
        },
        config = function()
            local builtin = require('telescope.builtin')
            local minifiles = require('mini.files')

            vim.keymap.set('n', '<leader>pf', function()
                minifiles.close()
                builtin.find_files()
            end, {})
            vim.keymap.set('n', '<leader>ps', function()
                minifiles.close()
                builtin.live_grep()
            end, {})
            vim.keymap.set('n', '<C-p>', function()
                minifiles.close()
                builtin.git_files()
            end, {})
            vim.keymap.set('n', '<leader>gb', function()
                minifiles.close()
                builtin.git_branches()
            end, {})
            vim.keymap.set('n', '<leader>gc', function()
                minifiles.close()
                builtin.git_commits()
            end, {})
        end,
    }
}
