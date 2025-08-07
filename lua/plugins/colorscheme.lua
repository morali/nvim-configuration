return {
    {
        "blazkowolf/gruber-darker.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            -- Apply the colorscheme after the plugin is loaded
            vim.cmd.colorscheme('gruber-darker')
        end
    },
    { "bignimbus/pop-punk.vim" },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("config.lualine")
        end
    },
}
