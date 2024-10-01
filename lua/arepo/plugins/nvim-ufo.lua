return {
	"kevinhwang91/nvim-ufo",
	lazy = true,
	dependencies = "kevinhwang91/promise-async",
	config = function()
		require("ufo").setup({
			provider_selector = function(bufnr, filetype, buftype)
				return { "treesitter", "indent" }
			end,
		})
	end,
}
