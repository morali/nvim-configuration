return {
    { 'tpope/vim-fugitive', cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse" } },
    { 'tpope/vim-rhubarb', dependencies = { 'tpope/vim-fugitive' } },
    { 'tpope/vim-tbone', cmd = { "Twrite", "Tyank", "Tput", "Tattach" } },
    { 'ntpeters/vim-better-whitespace', event = "BufReadPost" },
    { 'rkitover/vimpager', cmd = "Page" },
    { 'vim-python/python-syntax', ft = "python" },
    { 'tpope/vim-unimpaired', keys = { "[", "]" } },
    { 'andymass/vim-matchup', event = "BufReadPost" },
    { 'stevearc/conform.nvim', event = "BufWritePre", opts = {} },
    { 'kevinhwang91/nvim-bqf', ft = 'qf' },
    {
        'echasnovski/mini.pairs',
        event = "InsertEnter",
        config = function()
            require('mini.pairs').setup()
            local map = require('mini.pairs').map
            map('i', '<', { action = 'open', pair = '<>', neigh_pattern = '%a.', register = { cr = false } })
            map('i', '>', { action = 'close', pair = '<>', register = { cr = false } })
        end,
    },
    { "junegunn/fzf", lazy = true, build = "./install --bin" },
    {
        'andrewradev/linediff.vim',
        keys = {
            { '<leader>ld', ':Linediff<CR>', mode = 'v', desc = "Line Diff" }
        }
    },
    --{
    --    'ojroques/nvim-osc52',
    --    config = function()
    --        vim.keymap.set('n', '<leader>c', require('osc52').copy_operator, { expr = true })
    --        vim.keymap.set('n', '<leader>cc', '<leader>c_', { remap = true })
    --        vim.keymap.set('v', '<leader>c', require('osc52').copy_visual)
    --    end
    --},
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
}
