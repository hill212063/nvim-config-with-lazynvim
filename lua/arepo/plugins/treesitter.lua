return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"java",
				"go",
				"lua",
				"yaml",
				"json",
				"query",
				"html",
				"xml",
				"dart",
				"css",
				"sql",
				"markdown",
			},
			sync_install = false,
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
