return {
    -- { "nvim-treesitter/nvim-treesitter-context" },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        -- dependencies = { "nvim-treesitter/nvim-treesitter-context" },
        config = function()
            require("nvim-treesitter.configs").setup(
                {
                    highlight = { enable = true },
                    indent = { enable = true },
                    auto_install = true,
                    autotag = { enable = true },
                    rainbow = {
                        enable = true,
                        extended_mode = true,
                        max_file_lines = nil,
                    },
                    ensure_installed = {
                        "bash",
                        "c",
                        "diff",
                        "dockerfile",
                        "java",
                        "json",
                        "lua",
                        "markdown",
                        "python",
                        "query",
                        "ini",
                        "regex",
                        "sql",
                        "terraform",
                        "toml",
                        "vim",
                        "vimdoc",
                        "yaml",
                        "html",
                        "typescript",
                        "javascript",
                    }
                }
            )
        end
    }
}
