return {
	"MeanderingProgrammer/render-markdown.nvim",
	lazy = true,
	ft = "markdown",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
	config = function()
		vim.keymap.set("n", "mdt", function()
			vim.cmd(":RenderMarkdown toggle")
		end, { desc = "RenderMarkdown toggle" })
	end,
}
