return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason-lspconfig.nvim", "saghen/blink.cmp" },
		config = function()
			require("lspconfig")

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local buf = args.buf
				local o = function(desc) return { silent = true, buffer = buf, desc = desc } end

					vim.keymap.set("n", "gd", vim.lsp.buf.declaration, o("Go to declaration"))
					vim.keymap.set("n", "<c-]>", vim.lsp.buf.definition, o("Go to definition"))
					vim.keymap.set("n", "<c-k>", vim.lsp.buf.hover, o("Hover info"))
					vim.keymap.set("n", "gD", vim.lsp.buf.implementation, o("Go to implementation"))
					vim.keymap.set("n", "1gD", vim.lsp.buf.type_definition, o("Type definition"))
					vim.keymap.set("n", "gr", vim.lsp.buf.references, o("References"))
					vim.keymap.set("n", "g0", vim.lsp.buf.document_symbol, o("Document symbols"))
					vim.keymap.set("n", "<Leader>la", vim.lsp.buf.code_action, o("Code action"))
					vim.keymap.set("n", "<Leader>lR", vim.lsp.buf.rename, o("Rename symbol"))
					vim.keymap.set("n", "K", vim.diagnostic.open_float, o("Diagnostics float"))

					vim.keymap.set("n", "<Leader>lf", function()
						vim.lsp.buf.format({ async = true })
					end, o("Format buffer"))

					vim.keymap.set("x", "<Leader>lr", function()
						vim.lsp.buf.format({ async = true })
					end, o("Format selection"))
				end,
			})

			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local servers = { "clangd", "bashls", "lua_ls", "pylsp", "bitbake_ls", "rust_analyzer" }

			for _, server in ipairs(servers) do
				vim.lsp.config[server] =
					vim.tbl_deep_extend("force", vim.lsp.config[server] or {}, { capabilities = capabilities })

				vim.lsp.enable(server)
			end
		end,
	},
}
