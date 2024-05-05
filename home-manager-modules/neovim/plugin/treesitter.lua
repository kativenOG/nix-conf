require('nvim-treesitter.configs').setup {
    ensure_installed = {},

    auto_install = false, -- nix doesn't like this option 

    highlight = { enable = true },

    indent = { enable = true },
}
