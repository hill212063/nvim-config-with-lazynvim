return {
	"williamboman/mason.nvim",
	dependencies = { "williamboman/mason-lspconfig.nvim", "WhoIsSethDaniel/mason-tool-installer.nvim" },
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				-- LSP
				"tsserver",
				"tailwindcss",
				"html",
				"cssls",
				"lua_ls",
				"emmet_ls",
				"pyright",
				"jsonls",
				"gopls",
				"bashls",
				"dockerls",
				"terraformls",
				"docker_compose_language_service",
				"jdtls",
				"rust_analyzer",
				"helm_ls",
				"yamlls",
				"clangd",
			},
			-- auto-install config server (with lspconfig)
			automatic_installation = true,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- Formatter
				"stylua",
				"prettierd",
				"xmlformatter",
				"jq",
				"htmlbeautifier",
				"yamlfmt",
				"goimports",
				"gofumpt",
				"golines",
				"google-java-format",
				"rustfmt",
				"black",
				"clang-format",
				-- Linter
				"mypy",
				"ruff",
				"eslint_d",
				"gitlint",
				"golangci-lint",
				"yamllint",
				-- Debugger
				"debugpy",
				"delve",
				"js-debug-adapter",
				"chrome-debug-adapter",
			},
			automatic_installation = true,
		})
	end,
}
