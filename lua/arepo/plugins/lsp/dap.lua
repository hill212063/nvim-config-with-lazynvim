return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"tpope/vim-fugitive",
		"nvim-neotest/nvim-nio",
		"folke/trouble.nvim",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		-- Config for JS TS JSX TSX
		require("arepo.config.dap.dap-js")

		dapui.setup()
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		vim.keymap.set("n", "<Leader>dso", dap.step_over, { desc = "Debug step over" })
		vim.keymap.set("n", "<Leader>dsi", dap.step_into, { desc = "Debug step into" })
		vim.keymap.set("n", "<Leader>dsou", dap.step_out, { desc = "Debug step out" })
		vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, { desc = "Debug toggle breakpoint" })
		vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Debug continue" })
	end,
}
