
-- NOTE: Treesitter configuration

require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "help",
        "cpp",
        "lua",
        "typescript",
        "javascript",
        "html",
        "json",
        "css",
        "rust"
    },

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    }
}
