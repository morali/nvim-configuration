return {
	{
        -- Load after invoking keys
        keys = {
            { "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "Toggle CodeCompanion Chat" },
            { "<leader>ca", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "CodeCompanion Actions" },
            { "cc", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Add selection to CodeCompanion Chat" },
            { "<leader>ci", "<cmd>CodeCompanion<cr>", mode = { "n", "v" }, desc = "CodeCompanion Inline Chat" },
        },

		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"lalitmee/codecompanion-spinners.nvim",
			"MeanderingProgrammer/render-markdown.nvim",
			ft = { "markdown", "codecompanion" },
		},

        config = function()
            require("codecompanion").setup({
                interactions = {
                    chat = {
                        adapter = "copilot",
                        model = "claude-4.6-opus",
                        keymaps = {
                            close = false,
                            clear_approvals = {
                                modes = { n = "gbx" },
                                index = 19,
                                callback = "keymaps.clear_approvals",
                                description = "[Tools] Clear approvals",
                            },
                            yolo_mode = {
                                modes = { n = "gby" },
                                index = 20,
                                callback = "keymaps.yolo_mode",
                                description = "[Tools] Toggle YOLO mode",
                            },
                        },
                        opts = {
                            auto_save = true,
                            collapse_tools = false,
                        },
                        tools = {
                            ["cmd_runner"] = {
                                opts = {
                                    require_approval_before = true,
                                },
                            },
                        },
                    },
                },
                extensions = {
                    spinner = {
                        opts = {
                            style = "native",
                        },
                    },
                },
                rules = {
                    gtest_fff = {
                        description = "Linux shim header layer",
                        files = {
                            -- Literal file paths (absolute or relative to cwd)
                            "tests/llm_system_prompt.md",
                        },
                    },
                    kunit_tests = {
                        description = "Linux kunit llm rules",
                        files = {
                            "tests/llm_system_prompt_kunit.md",
                        },
                    },
                },
                adapters = {
                    acp = {
                        cursor = "cursor",
                    },
                    http = {
                        openrouter = require("codecompanion.adapters").extend(function()
                            return require("codecompanion.utils.openrouter")
                        end,
                            {
                                schema = {
                                    model = {
                                        default = "deepseek/deepseek-v3.2",
                                    },
                                    ["reasoning.effort"] = {
                                        default = "none",
                                    },
                                    reasoning_effort = {
                                        default = "none",
                                        enabled = function(_) return false end,
                                    },
                                },
                            })
                    },
                },
            })
        end
    }
}
