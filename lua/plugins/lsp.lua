return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate"
    },
    { "williamboman/mason-lspconfig.nvim" },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require('lspconfig')
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local on_attach = function(client, bufnr)
                -- LSP mappings
                vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.declaration()<CR>", { silent = true, buffer = bufnr })
                vim.keymap.set("n", "<c-]>", "<cmd>lua vim.lsp.buf.definition()<CR>", { silent = true, buffer = bufnr })
                vim.keymap.set("n", "<c-k>", "<cmd>lua vim.lsp.buf.hover()<CR>", { silent = true, buffer = bufnr })
                vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.implementation()<CR>", { silent = true, buffer = bufnr })
                vim.keymap.set("n", "1gD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { silent = true, buffer = bufnr })
                vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { silent = true, buffer = bufnr })
                vim.keymap.set("n", "g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", { silent = true, buffer = bufnr })
                vim.keymap.set("n", "<Leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", { silent = true, buffer = bufnr })
                vim.keymap.set("n", "<Leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", { silent = true, buffer = bufnr })
                vim.keymap.set("n", "<Leader>lr", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", { silent = true, buffer = bufnr })
                vim.keymap.set("x", "<Leader>lr", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", { silent = true, buffer = bufnr })
            end

            local servers = { 'clangd', 'bashls', 'lua_ls' , 'pylsp' }

            for _, server in ipairs(servers) do
                lspconfig[server].setup {
                    on_attach = on_attach,
                    capabilities = capabilities,
                }
            end
        end
    },
}
