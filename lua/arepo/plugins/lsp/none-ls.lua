return {
	"nvimtools/none-ls.nvim",
	dependencies = { "mason.nvim" },
	opt = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- C++
				null_ls.builtins.formatting.clang_format,
				-- TS/JS
				null_ls.builtins.formatting.prettierd,
				-- Python
				null_ls.builtins.formatting.black,
				null_ls.builtins.diagnostics.mypy,
				null_ls.builtins.diagnostics.ruff,
				-- Go
				null_ls.builtins.formatting.goimports,
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.formatting.golangci_lint,
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
		})
	end,
}
