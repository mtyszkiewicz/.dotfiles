local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

-- Use a protected call so we don't error out on first use
local ok, lazy = pcall(require, "lazy")
if not ok then
    return
end

lazy.setup({
    spec = {
        { import = "mtyszkiewicz.plugins" },
        {
            { 'nvim-lua/plenary.nvim' },
            { 'isobit/vim-caddyfile',   event = 'VeryLazy' },
            { 'kylechui/nvim-surround', event = 'VeryLazy' },
            {
                'fei6409/log-highlight.nvim',
                config = function()
                    require('log-highlight').setup {}
                end,
            },
            {
                'alexghergh/nvim-tmux-navigation',
                config = function()
                    local nvim_tmux_nav = require('nvim-tmux-navigation')

                    nvim_tmux_nav.setup {
                        disable_when_zoomed = true -- defaults to false
                    }

                    vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
                    vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
                    vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
                    vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
                    vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
                    vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
                end
            }
        }
    },
    -- checker = { enabled = true },
})
