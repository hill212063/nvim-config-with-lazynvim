return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile", "BufEnter" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
		{
			"towolf/vim-helm",
			ft = "helm",
			event = { "BufReadPre", "BufNewFile", "BufEnter" },
		},
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- Setup LSP default
		for _, lsp in ipairs({
			"vimls",
			"html",
			"cssls",
			"lua_ls",
			"emmet_ls",
			"ruff_lsp",
			"jedi_language_server",
			"jsonls",
			"gopls",
			"bashls",
			"dockerls",
			"docker_compose_language_service",
			"terraformls",
			"jdtls",
			"clangd",
		}) do
			lspconfig[lsp].setup({})
		end

		-- setup LSP custom
		lspconfig.helm_ls.setup({
			settings = {
				["helm-ls"] = {
					yamlls = {
						enabled = false,
						path = "yaml-language-server",
					},
				},
			},
		})
		lspconfig.yamlls.setup({
			settings = {
				yaml = {
					schemas = {
						["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
						["https://json.schemastore.org/pre-commit-config.json"] = "/.pre-commit-config.*",
						["https://json.schemastore.org/catalog-info.json"] = ".backstage/*.yaml",
						["https://raw.githubusercontent.com/iterative/dvcyaml-schema/master/schema.json"] = "**/dvc.yaml",
						["https://json.schemastore.org/swagger-2.0.json"] = "**/swagger.yaml",
					},
				},
			},
		})

		-- Global mappings.
		-- See `:help vim.diagnostic.*` for documentation on any of the below functions
		vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
		vim.keymap.set("n", "<leader>dq", vim.diagnostic.setloclist)
		-- keymap
		-- Use LspAttach autocommand to only map the following keys
		-- after the language server attaches to the current buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
				vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
				vim.keymap.set("n", "<leader>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts)
				vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "<leader>f", function()
					vim.lsp.buf.format({ async = true })
				end, opts)
			end,
		})

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- lspconfig.on_attach()
	end,
}
