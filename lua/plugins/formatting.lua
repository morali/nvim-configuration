return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				rust = { "rustfmt" },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
		})

		-- Set formatexpr globally.
		-- This allows 'gq' (Visual mode) and 'gq{motion}' (Normal mode) to use Conform.
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
