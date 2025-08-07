return {
    { 'tpope/vim-fugitive' },
    { 'tpope/vim-rhubarb' },
    { 'tpope/vim-tbone' },
    { 'ntpeters/vim-better-whitespace' },
    { 'rkitover/vimpager' },
    { 'vim-python/python-syntax' },
    { 'tpope/vim-unimpaired' },
    { 'andymass/vim-matchup' },
    { 'stevearc/conform.nvim', opts = {} },
    { 'kevinhwang91/nvim-bqf', ft = 'qf' },
    { "junegunn/fzf", build = "./install --bin" },
    {
        'andrewradev/linediff.vim',
        keys = {
            { '<leader>ld', ':Linediff<CR>', mode = 'v', desc = "Line Diff" }
        }
    },
    {
        'ojroques/nvim-osc52',
        config = function()
            vim.keymap.set('n', '<leader>c', require('osc52').copy_operator, { expr = true })
            vim.keymap.set('n', '<leader>cc', '<leader>c_', { remap = true })
            vim.keymap.set('v', '<leader>c', require('osc52').copy_visual)
        end
    },
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "yetone/avante.nvim",
        build = "make",
        event = "VeryLazy",
        opts = require("config.avante"),
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "echasnovski/mini.pick",
            "nvim-telescope/telescope.nvim",
            "folke/snacks.nvim",
            "nvim-tree/nvim-web-devicons",
            {
                "MeanderingProgrammer/render-markdown.nvim",
                opts = { file_types = { "markdown", "Avante" } },
                ft = { "markdown", "Avante" },
            },
        },
    },
}
