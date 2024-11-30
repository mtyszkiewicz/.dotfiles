return {
    {
        "nvim-treesitter/nvim-treesitter-context"
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-context",
        },
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            auto_install = true,
            ensure_installed = {
                "bash",
                "diff",
                "dockerfile",
                "java",
                "json",
                "lua",
                "markdown",
                "python",
                "query",
                "regex",
                "sql",
                "terraform",
                "toml",
                "vim",
                "vimdoc",
                "yaml",
            }
        }
    }
}
