return {
  "mfussenegger/nvim-dap",
  dependencies = {
    {
      "rcarriga/nvim-dap-ui",
      dependencies = { "nvim-neotest/nvim-nio" },
      config = function()
	local dapui = require("dapui")
	dapui.setup()

	local dap = require("dap")
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end
      end,
    },
  },
  keys = {
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
    { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
    { "<leader>do", function() require("dap").step_over() end, desc = "Step over" },
    { "<leader>di", function() require("dap").step_into() end, desc = "Step into" },
    { "<leader>dO", function() require("dap").step_out() end, desc = "Step out" },
    { "<leader>dr", function() require("dap").repl.open() end, desc = "Open REPL" },
    { "<leader>dl", function() require("dap").run_last() end, desc = "Run last" },
    { "<leader>du", function() require("dapui").toggle({ reset = true }) end, desc = "Toggle DAP UI" },
  },
  config = function()
	local dap = require("dap")

	dap.adapters.gdb = {
		type = "executable",
		command = "gdb",
		args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
	}

	local gdb_config = {
		{
			name = "Launch",
			type = "gdb",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/build/", "file")
			end,
			cwd = "${workspaceFolder}/build",
			stopAtBeginningOfMainSubprogram = true,
			setupCommands = {
				{ text = "set disable-randomization off" },
			},
		},
	}

	dap.configurations.cpp = gdb_config
	dap.configurations.c = gdb_config
	dap.configurations.rust = gdb_config

	-- Alias for neotest-gtest expecting codelldb
	dap.adapters.codelldb = dap.adapters.gdb
  end,
}

