local wk = require("which-key")

wk.setup({
    delay = 200,
    icons = {
        mappings = false,
        keys = {
            Up = "Up ",
            Down = "Down ",
            Left = "Left ",
            Right = "Right ",
            C = "Ctrl-",
            M = "Alt-",
            S = "Shift-",
            CR = "Enter ",
            Esc = "Esc ",
            BS = "Backspace ",
            Space = "Space ",
            Tab = "Tab ",
            F1 = "F1 ",
            F2 = "F2 ",
            F3 = "F3 ",
            F4 = "F4 ",
            F5 = "F5 ",
            F6 = "F6 ",
            F7 = "F7 ",
            F8 = "F8 ",
            F9 = "F9 ",
            F10 = "F10 ",
            F11 = "F11 ",
            F12 = "F12 ",
        },
    },
    win = {
        border = "single",
    },
})

wk.add({
    { "<leader>c", group = "CodeCompanion" },
    { "<leader>d", group = "Debug" },
    { "<leader>f", group = "Find (fzf)" },
    { "<leader>l", group = "LSP" },
    { "<leader>m", group = "Meson" },
    { "<leader>r", group = "Ripgrep" },
    { "<leader>t", group = "Test" },
    { "g", group = "Goto" },
})
