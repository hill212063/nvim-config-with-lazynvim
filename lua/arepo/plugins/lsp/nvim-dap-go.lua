return {
	"leoluz/nvim-dap-go",
	lazy = true,
	ft = "go",
	dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
	config = function()
		require("dap-go").setup()
	end,
}
