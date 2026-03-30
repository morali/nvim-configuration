return {
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local fzf = require("fzf-lua")

            fzf.setup({
                "default-title",
                winopts = {
                    height = 0.85,
                    width = 0.80,
                    row = 0.35,
                    col = 0.50,
                    preview = {
                        layout = "horizontal",
                        horizontal = "right:50%",
                    },
                },
                keymap = {
                    builtin = {
                        ["<C-\\>"] = "toggle-preview",
                        ["<C-d>"] = "preview-page-down",
                        ["<C-u>"] = "preview-page-up",
                    },
                    fzf = {
                        ["ctrl-q"] = "select-all+accept",
                        ["ctrl-j"] = "down",
                        ["ctrl-k"] = "up",
                        ["ctrl-d"] = "half-page-down",
                        ["ctrl-u"] = "half-page-up",
                    },
                },
                files = {
                    cmd = "fd --type f --strip-cwd-prefix --hidden --exclude .git",
                    git_icons = false,
                    file_icons = true,
                },
                git = {
                    files = {
                        cmd = "git ls-files --exclude-standard",
                        git_icons = false,
                    },
                },
                grep = {
                    rg_opts = "--column --line-number --no-heading --color=always --smart-case --hidden --glob '!.git/*'",
                },
                buffers = {
                    sort_lastused = true,
                },
            })

            -- Register as vim.ui.select handler
            fzf.register_ui_select()

            vim.keymap.set("n", "<C-p>", fzf.files, { desc = "Find files" })
            vim.keymap.set("n", "<leader>rg", fzf.live_grep, { desc = "[R]ip[g]rep" })
            vim.keymap.set("n", "<leader>]", fzf.grep_cword, { desc = "[G]rep word under [C]ursor" })
            vim.keymap.set("n", "<leader>gl", fzf.blines, { desc = "[G]rep [L]ines in buffer" })

            vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find all files" })
            vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Grep (live)" })
            vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Buffers" })
            vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Help tags" })
            vim.keymap.set("n", "<leader>sf", function()
                fzf.files({ query = vim.fn.expand("<cWORD>") })
            end, { desc = "Find file under cursor" })

            -- LSP integration (replaces telescope for LSP pickers)
            vim.keymap.set("n", "<leader>lr", fzf.lsp_references, { desc = "LSP references" })
            vim.keymap.set("n", "<leader>ls", fzf.lsp_document_symbols, { desc = "LSP symbols" })
        end,
    },
}
