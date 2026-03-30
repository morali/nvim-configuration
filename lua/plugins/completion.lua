return {
    {
        'saghen/blink.cmp',
        version = '1.*',
        dependencies = {
            'rafamadriz/friendly-snippets',
            'fang2hou/blink-copilot',
        },
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                preset = 'none',
                ['<C-b>'] = { 'scroll_documentation_up' },
                ['<C-f>'] = { 'scroll_documentation_down' },
                ['<C-Space>'] = { 'show' },
                ['<C-e>'] = { 'cancel' },
                ['<CR>'] = { 'accept', 'fallback' },
                ['<C-n>'] = { 'select_next', 'fallback' },
                ['<C-p>'] = { 'select_prev', 'fallback' },
                ['<Tab>'] = { 'snippet_forward', 'fallback' },
                ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
            },
            appearance = {
                nerd_font_variant = 'mono',
            },
            completion = {
                documentation = { auto_show = true },
                list = {
                    max_items = 50,
                    selection = { preselect = true, auto_insert = false },
                },
            },
            signature = { enabled = true },
            sources = {
                default = { 'lsp', 'copilot', 'path', 'snippets', 'buffer' },
                providers = {
                    copilot = {
                        name = "copilot",
                        module = "blink-copilot",
                        async = true,
                        score_offset = 100,
                    },
                    buffer = {
                        min_keyword_length = 3,
                        max_items = 10,
                    },
                },
            },
            fuzzy = { implementation = "prefer_rust_with_warning" },
            cmdline = {
                enabled = true,
                keymap = {
                    preset = 'none',
                    ['<Tab>'] = { 'show', 'accept', 'fallback' },
                    ['<S-Tab>'] = { 'select_prev', 'fallback' },
                    ['<C-n>'] = { 'select_next', 'fallback' },
                    ['<C-p>'] = { 'select_prev', 'fallback' },
                    ['<CR>'] = { 'fallback' },
                    ['<C-e>'] = { 'cancel', 'fallback' },
                },
                completion = {
                    menu = { auto_show = true },
                },
            },
        },
        opts_extend = { "sources.default" },
    },
}
