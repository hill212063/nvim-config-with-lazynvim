local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "arepo.plugins" },
	{ import = "arepo.plugins.git" },
	{ import = "arepo.plugins.telescope" },
	{ import = "arepo.plugins.lsp" },
	{ import = "arepo.plugins.lsp.go" },
	{ import = "arepo.plugins.lsp.java" },
	{ import = "arepo.plugins.lsp.python" },
})
