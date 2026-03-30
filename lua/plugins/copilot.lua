return {
--	{
--		"CopilotC-Nvim/CopilotChat.nvim",
--		dependencies = {
--			{ "nvim-lua/plenary.nvim", branch = "master" },
--		},
--		build = "make tiktoken",
--		opts = {
--			--            model = 'claude-opus-4.5',           -- AI model to use
--			model = "gpt-5-mini", -- AI model to use
--			temperature = 0.1, -- Lower = focused, higher = creative
--			window = {
--				layout = "vertical", -- 'vertical', 'horizontal', 'float'
--				width = 0.5, -- 50% of screen width
--			},
--			auto_insert_mode = false, -- Enter insert mode when opening
--		},
--		keys = {
--			-- Show Prompts actions with telescope
--			{
--				"<leader>cp",
--				function()
--					require("CopilotChat").select_prompt()
--				end,
--				mode = { "n", "v" },
--			},
--
--			-- Quick Chat (ask a question without a prompt template)
--			{
--				"<leader>cq",
--				function()
--					local input = vim.fn.input("Quick Chat: ")
--					if input ~= "" then
--						require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
--					end
--				end,
--				mode = { "n", "v" },
--			},
--
--			-- Toggle the chat window
--			{ "<leader>ct", "<cmd>CopilotChatToggle<cr>" },
--
--			-- Specific Context Actions
--			{ "<leader>ce", "<cmd>CopilotChatExplain<cr>", mode = { "n", "v" } },
--			{ "<leader>cf", "<cmd>CopilotChatFix<cr>", mode = { "n", "v" } },
--			{ "<leader>co", "<cmd>CopilotChatOptimize<cr>", mode = { "n", "v" } },
--			{ "<leader>cd", "<cmd>CopilotChatDocs<cr>", mode = { "n", "v" } },
--			{ "<leader>cr", "<cmd>CopilotChatReview<cr>", mode = { "n", "v" } },
--			{ "<leader>cx", "<cmd>CopilotChatReset<cr>" },
--		},
--	},
    "zbirenbaum/copilot.lua",
    requires = {
    },
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
        suggestion = {
            enabled = false,   -- disables inline autocompletion
            auto_trigger = false,
        },
        panel = {
            enabled = false,
        },
    })
    end,
}
