
return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        opts = {
            ensure_installed = {
                'vim', 'javascript', 'typescript', 'css', 'html', 'json', 'lua',
                'cpp', 'c', 'python', 'matlab', 'bash', 'verilog', 'groovy',
                'dockerfile', 'vimdoc', 'rust',
            },
            auto_install = true,
        },
        config = function(_, opts)
            local ok, configs = pcall(require, 'nvim-treesitter.configs')
            if ok then
                configs.setup(opts)
            else
                require('nvim-treesitter').setup(opts)
            end
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        branch = "main",
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            require("nvim-treesitter-textobjects").setup({
                select = { lookahead = true },
                move = { set_jumps = true },
            })

            local select = require("nvim-treesitter-textobjects.select").select_textobject
            local move = require("nvim-treesitter-textobjects.move")

            -- Select textobjects
            for _, mode in ipairs({ "x", "o" }) do
                vim.keymap.set(mode, "af", function() select("@function.outer", "textobjects") end, { desc = "Around function" })
                vim.keymap.set(mode, "if", function() select("@function.inner", "textobjects") end, { desc = "Inside function" })
                vim.keymap.set(mode, "ac", function() select("@class.outer", "textobjects") end, { desc = "Around class" })
                vim.keymap.set(mode, "ic", function() select("@class.inner", "textobjects") end, { desc = "Inside class" })
                vim.keymap.set(mode, "al", function() select("@loop.outer", "textobjects") end, { desc = "Around loop" })
                vim.keymap.set(mode, "il", function() select("@loop.inner", "textobjects") end, { desc = "Inside loop" })
                vim.keymap.set(mode, "ai", function() select("@conditional.outer", "textobjects") end, { desc = "Around conditional" })
                vim.keymap.set(mode, "ii", function() select("@conditional.inner", "textobjects") end, { desc = "Inside conditional" })
                vim.keymap.set(mode, "aa", function() select("@parameter.outer", "textobjects") end, { desc = "Around parameter" })
                vim.keymap.set(mode, "ia", function() select("@parameter.inner", "textobjects") end, { desc = "Inside parameter" })
            end

            -- Move to next/previous function
            vim.keymap.set({ "n", "x", "o" }, "]m", function() move.goto_next_start("@function.outer", "textobjects") end, { desc = "Next function start" })
            vim.keymap.set({ "n", "x", "o" }, "]M", function() move.goto_next_end("@function.outer", "textobjects") end, { desc = "Next function end" })
            vim.keymap.set({ "n", "x", "o" }, "[m", function() move.goto_previous_start("@function.outer", "textobjects") end, { desc = "Prev function start" })
            vim.keymap.set({ "n", "x", "o" }, "[M", function() move.goto_previous_end("@function.outer", "textobjects") end, { desc = "Prev function end" })

            -- Move to next/previous class
            vim.keymap.set({ "n", "x", "o" }, "]]", function() move.goto_next_start("@class.outer", "textobjects") end, { desc = "Next class start" })
            vim.keymap.set({ "n", "x", "o" }, "][", function() move.goto_next_end("@class.outer", "textobjects") end, { desc = "Next class end" })
            vim.keymap.set({ "n", "x", "o" }, "[[", function() move.goto_previous_start("@class.outer", "textobjects") end, { desc = "Prev class start" })
            vim.keymap.set({ "n", "x", "o" }, "[]", function() move.goto_previous_end("@class.outer", "textobjects") end, { desc = "Prev class end" })

            -- Move to next/previous conditional
            vim.keymap.set({ "n", "x", "o" }, "]d", function() move.goto_next("@conditional.outer", "textobjects") end, { desc = "Next conditional" })
            vim.keymap.set({ "n", "x", "o" }, "[d", function() move.goto_previous("@conditional.outer", "textobjects") end, { desc = "Prev conditional" })
        end,
    },
    { 'nvim-treesitter/nvim-treesitter-context', event = "BufReadPost" },
}
