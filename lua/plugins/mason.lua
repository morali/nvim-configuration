return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"stylua",
				"rustfmt",
			},
		})

		require("mason-lspconfig").setup({
			ensure_installed = {
				"clangd",
				"bashls",
				"lua_ls",
				"pylsp",
				"rust_analyzer",
			},
			automatic_installation = true,
		})
	end,
}
