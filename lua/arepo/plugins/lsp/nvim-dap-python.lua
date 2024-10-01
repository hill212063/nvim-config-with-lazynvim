return {
	"mfussenegger/nvim-dap-python",
	lazy = true,
	ft = "python",
	dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
	config = function()
		require("dap-python").setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")
	end,
}
