-- File: lua/config/lsp.lua

local lspconfig = require('lspconfig')

-- 1. Get the LSP capabilities for nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- This is the base configuration that will be applied to ALL servers
local on_attach = function(client, bufnr)
end

-- 2. A list of servers to set up with the default configuration
local servers = { 'clangd', 'bashls', 'lua_ls' }

for _, server in ipairs(servers) do
    lspconfig[server].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end
