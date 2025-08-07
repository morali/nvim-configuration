-- list the plugins to install
return {
    -- better syntax highlighting
    {
        'tpope/vim-fugitive',
    },
    {
        'tpope/vim-rhubarb',
    },
    {
        'tpope/vim-tbone',
    },
    {
        'ntpeters/vim-better-whitespace',
    },
    {
        'rkitover/vimpager',
    },
    {
        'vim-python/python-syntax',
    },
    {
        'bignimbus/pop-punk.vim',
    },
    {
        'tpope/vim-unimpaired',
    },
    {
        'preservim/nerdtree',
    },
    {
        'andymass/vim-matchup',
    },
    {
        'andrewradev/linediff.vim',
    },
    {
        'stevearc/aerial.nvim',
        opts = {},
        -- optional dependencies
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
    },
    { "junegunn/fzf",                           build = "./install --bin" },
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- calling `setup` is optional for customization
            require("fzf-lua").setup({})
        end,
        opts = {
            fzf_opts = {
                ["--history"] = "~/.local/share/fzf-history",
            },
        },
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':tsupdate',
    },
    { 'nvim-treesitter/nvim-treesitter-context' },
    --{
    --	"zbirenbaum/copilot.lua",
    --	cmd = "copilot",
    --	event = "insertenter",
    --	config = function()
    --		require("copilot").setup({
    --			suggestion = { enabled = false },
    --			panel = { enabled = false },
    --		})
    --	end,
    --},
    {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup()
        end
    },
    {
        'folke/which-key.nvim',
    },
    {
        'nvim-telescope/telescope.nvim',
        lazy = true,
        dependencies = {
            'nvim-lua/plenary.nvim'

        }
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -s. -bbuild -dcmake_build_type=release && cmake --build build --config release' },
    {
        'hrsh7th/cmp-nvim-lsp'
    },
    {
        'hrsh7th/cmp-buffer'
    },
    {
        'hrsh7th/cmp-path'
    },
    {
        'hrsh7th/cmp-cmdline'
    },
    {
        'hrsh7th/nvim-cmp'
    },
    {
        'hrsh7th/cmp-vsnip'
    },
    {
        'hrsh7th/vim-vsnip'
    },
    {
        'hrsh7th/vim-vsnip-integ'
    },
    {
        'hrsh7th/cmp-nvim-lsp-signature-help'
    },
    {
        'kevinhwang91/nvim-bqf',
        ft = 'qf'
    },
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    {
        'stevearc/conform.nvim',
        opts = {},
    },
    { 'ojroques/nvim-osc52' },
    { "blazkowolf/gruber-darker.nvim" },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
}
