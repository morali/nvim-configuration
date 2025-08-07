return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim', { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' } },
        config = function()
            local telescope = require('telescope')
            local actions = require('telescope.actions')
            local builtin = require('telescope.builtin')
            local layout = require('telescope.actions.layout')
            local moveUp =
                actions.move_selection_previous
                + actions.move_selection_previous
                + actions.move_selection_previous
                + actions.move_selection_previous
                + actions.move_selection_previous
                + actions.move_selection_previous

            local moveDown =
                actions.move_selection_next
                + actions.move_selection_next
                + actions.move_selection_next
                + actions.move_selection_next
                + actions.move_selection_next
                + actions.move_selection_next

            telescope.setup {
                defaults = {
                     --== New layout configuration ==--
                    mappings = { -- Add mappings for both insert and normal mode
                        i = {
                            ["<C-o>"] = actions.send_selected_to_qflist + actions.open_qflist,
                            ["<C-p>"] = layout.toggle_preview,
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-d>"] = moveDown,
                            ["<C-u>"] = moveUp,
                            ["<C-a>"] = actions.toggle_all,
                        },
                        n = {
                            ["<C-o>"] = actions.send_selected_to_qflist + actions.open_qflist,
                            ["<C-p>"] = layout.toggle_preview,
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-d>"] = moveDown,
                            ["<C-u>"] = moveUp,
                            ["<C-a>"] = actions.toggle_all,
                        },
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    }
                }
            }
            telescope.load_extension('fzf')

            vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = "[F]ind [F]iles" })
            vim.keymap.set('n', '<leader>rg', builtin.live_grep, { desc = "[R]ip[g]rep" })
            vim.keymap.set('n', '<leader>]', builtin.grep_string, { desc = "[G]rep word under [C]ursor" })
            vim.keymap.set('n', '<leader>gl', builtin.current_buffer_fuzzy_find, { desc = "[G]rep [L]ines in buffer" })

            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
            vim.keymap.set('n', '<leader>sf', function() builtin.find_files({ default_text = vim.fn.expand('<cWORD>') }) end, {})
        end
    },
}
