return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
        config = function ()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                    "sql",
                    "python",
                    "bash",
                    "yaml",
                    "toml",
                    "dockerfile",
                    "json"
                },
                sync_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
}