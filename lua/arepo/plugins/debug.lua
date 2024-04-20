return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")
		local map = vim.api.nvim_set_keymap
		map("n", "<leader>dt", dap.toggle_breakpoint, {})
		map("n", "<leader>dc", dap.continue, {})
	end,
}
