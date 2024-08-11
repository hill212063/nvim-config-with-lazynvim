return {
	"nvimtools/none-ls.nvim",
	dependencies = { "mason.nvim" },
	opt = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup({
			sources = {
				-- Python
				null_ls.builtins.formatting.black,
				null_ls.builtins.diagnostics.mypy,
				null_ls.builtins.diagnostics.ruff,
				-- Go
				null_ls.builtins.formatting.goimports,
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.formatting.golines,
				-- Java
				null_ls.builtins.formatting.google_java_format,
				null_ls.builtins.diagnostics.checkstyle.with({
					extra_args = { "-c", "/google_checks.xml" }, -- or "/sun_checks.xml" or path to self written rules
				}),
				null_ls.builtins.diagnostics.pmd.with({
					extra_args = {
						"--rulesets",
						"category/java/bestpractices.xml,category/jsp/bestpractices.xml", -- or path to self-written ruleset
					},
				}),
			},
			-- Auto format
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({
						group = augroup,
						buffer = bufnr,
					})
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
		})
	end,
}
