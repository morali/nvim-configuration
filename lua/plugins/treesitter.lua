
return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        opts = {
            ensure_installed = {
                'vim', 'javascript', 'typescript', 'css', 'html', 'json', 'lua',
                'cpp', 'c', 'python', 'matlab', 'bash', 'verilog', 'groovy',
                'dockerfile', 'vimdoc',
            },
            auto_install = true,
            textobjects = {
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        ["]m"] = "@function.outer",
                        ["]]"] = "@class.outer",
                        ["]o"] = "@loop.*",
                        ["]s"] = { query = "@scope", query_group = "locals" },
                        ["]z"] = { query = "@fold", query_group = "folds" },
                    },
                    goto_next_end = {
                        ["]M"] = "@function.outer",
                        ["]["] = "@class.outer",
                    },
                    goto_previous_start = {
                        ["[m"] = "@function.outer",
                        ["[["] = "@class.outer",
                    },
                    goto_previous_end = {
                        ["[M"] = "@function.outer",
                        ["[]"] = "@class.outer",
                    },
                    goto_next = {
                        ["]d"] = "@conditional.outer",
                    },
                    goto_previous = {
                        ["[d"] = "@conditional.outer",
                    },
                },
            },
        },
        config = function(_, opts)
            require('nvim-treesitter').setup(opts)
        end,
    },
    { 'nvim-treesitter/nvim-treesitter-context', event = "BufReadPost" },
}
