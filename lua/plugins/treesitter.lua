return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost" },
    -- lazy = true,
    opts = {
        ensure_installed = {
            "lua",
            "javascript",
            "typescript",
            "css",
            "svelte",
        },
        sync_install = false,
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        compilers = {},
    },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    config = function(plugin, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
