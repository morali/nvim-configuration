return {
    {
        'folke/which-key.nvim',
        config = function()
            require('config.which-key')
        end
    },
    {
        'stevearc/aerial.nvim',
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
        -- Use the 'keys' table to create a keymap that will load the plugin on use.
        keys = {
            {
                "<leader>a",
                function() require("aerial").toggle() end,
                desc = "Toggle Aerial"
            }
        },
        opts = {}, -- You can add aerial configurations here later
    },
    {
        'preservim/nerdtree',
        keys = {
            { "<F3>", "<cmd>NERDTreeFind<CR>", desc = "NERDTree Find" },
            { "<F4>", "<cmd>NERDTreeToggle<CR>", desc = "NERDTree Toggle" },
        }
    },
}
