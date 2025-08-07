return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = {
                    'vim', 'javascript', 'typescript', 'css', 'html', 'json', 'lua', 'cpp', 'c', 'python', 'matlab', 'bash', 'verilog', 'groovy', 'dockerfile', 'vimdoc',
                },
                auto_install = false,
                sync_install = false,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = true },
                textobjects = {
                    move = {
                      enable = true,
                      set_jumps = true,
                      goto_next_start = {
                        ["]m"] = "@function.outer",
                        ["]]"] = { query = "@class.outer", desc = "Next class start" },
                        ["]o"] = "@loop.*",
                        ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
                        ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
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
                      }
                    },
                },
            }
        end,
    },
    { 'nvim-treesitter/nvim-treesitter-context' },
}
