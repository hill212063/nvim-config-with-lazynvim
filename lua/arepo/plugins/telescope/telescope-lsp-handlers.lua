return {
	"Slotos/telescope-lsp-handlers.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("telescope-lsp-handlers").setup()
	end,
}
