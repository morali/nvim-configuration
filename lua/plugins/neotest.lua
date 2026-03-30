return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-neotest/nvim-nio",
		"alfaix/neotest-gtest",
		"nvim-treesitter/nvim-treesitter",
		"mfussenegger/nvim-dap",
		"rcarriga/nvim-dap-ui",
		"jay-babu/mason-nvim-dap.nvim",
		-- your other adapters here
	},
    keys = {
        { "<leader>tr", function() require("neotest").run.run() end, desc = "Run nearest test" },
        { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run file" },
        { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle test summary" },
        { "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "Debug nearest test" },
    },
	config = function()
		local neotest = require("neotest")

		neotest.setup({
			adapters = {
				require("neotest-gtest").setup({
					-- 1. Force recognition of .cpp files
					is_test_file = function(file_path)
						return string.match(file_path, "%.cpp$")
					end, -- <--- Added comma here (good practice)

					-- 2. Optional: Explicit root directory (uncomment if needed)
					-- root = "build",
				}),
			},
		})
	end,
}
