return {
	"nvim-telescope/telescope.nvim",
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local builtin = require("telescope.builtin")

		-- File Pickers
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope Find files" })
		vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Telescope Git files" })
		vim.keymap.set("n", "<leader>fl", builtin.live_grep, { desc = "Telescope Live Grep" })
		vim.keymap.set("n", "<leader>fs", builtin.grep_string, { desc = "Telescope Grep String" })

		-- Vim Pickers
		vim.keymap.set("n", "<leader>vb", builtin.buffers, { desc = "Telescope Buffer" })
		vim.keymap.set("n", "<leader>vs", builtin.search_history, { desc = "Telescope Search History" })
		vim.keymap.set("n", "<leader>vr", builtin.registers, { desc = "Telescope Registers" })
		vim.keymap.set("n", "<leader>vk", builtin.keymaps, { desc = "Telescope Keymaps" })
		vim.keymap.set("n", "<leader>vss", builtin.spell_suggest, { desc = "Telescope Spell Suggest" })
		vim.keymap.set("n", "<leader>vft", builtin.filetypes, { desc = "Telescope Filetypes" })
		vim.keymap.set(
			"n",
			"<leader>vff",
			builtin.current_buffer_fuzzy_find,
			{ desc = "Telescope Current Buffer Fuzzy Find" }
		)

		-- Neovim LSP Pickers
		vim.keymap.set(
			"n",
			"<leader>ldws",
			builtin.lsp_dynamic_workspace_symbols,
			{ desc = "Telescope LSP Dynamic Workspace Symbols" }
		)
		vim.keymap.set("n", "<leader>ld", builtin.diagnostics, { desc = "Telescope Diagnostics" })
		-- ***Below can be used by lsp config with telescope lsp handler***
		-- vim.keymap.set("n", "<leader>lgd", builtin.lsp_definitions, { desc = "Telescope LSP Definitions" })
		-- vim.keymap.set("n", "<leader>lgi", builtin.lsp_implementations, { desc = "Telescope LSP Implementations" })
		-- vim.keymap.set("n", "<leader>ltd", builtin.lsp_type_definitions, { desc = "Telescope LSP Type Definitions" })
		-- vim.keymap.set("n", "<leader>lr", builtin.lsp_references, { desc = "Telescope LSP References" })
		-- vim.keymap.set("n", "<leader>lds", builtin.lsp_document_symbols, { desc = "Telescope LSP Document Symbols" })
		-- vim.keymap.set("n", "<leader>lws", builtin.lsp_workspace_symbols, { desc = "Telescope LSP Workspace Symbols" })
		-- vim.keymap.set("n", "<leader>lic", builtin.lsp_incoming_calls, { desc = "Telescope LSP Incoming Calls" })
		-- vim.keymap.set("n", "<leader>loc", builtin.lsp_outgoing_calls, { desc = "Telescope LSP Outgoing Calls" })

		-- Git Pickers
		vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Telescope Git Commits" })
		vim.keymap.set("n", "<leader>gbc", builtin.git_bcommits, { desc = "Telescope Git BCommits" })
		vim.keymap.set("n", "<leader>gbr", builtin.git_bcommits_range, { desc = "Telescope Git BCommits Range" })
		vim.keymap.set("n", "<leader>gs", builtin.git_stash, { desc = "Telescope Git Stash" })
		vim.keymap.set("n", "<leader>gss", builtin.git_status, { desc = "Telescope Git Status" })
		vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Telescope Git Branches" })

		-- Live grep focus preview
		local focus_preview = function(prompt_bufnr)
			local action_state = require("telescope.actions.state")
			local picker = action_state.get_current_picker(prompt_bufnr)
			local prompt_win = picker.prompt_win
			local previewer = picker.previewer
			local winid = previewer.state.winid
			local bufnr = previewer.state.bufnr
			vim.keymap.set("n", "<Tab>", function()
				vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", prompt_win))
			end, { buffer = bufnr })
			vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", winid))
			-- api.nvim_set_current_win(winid)
		end
		require("telescope").setup({
			defaults = {
				mappings = {
					n = {
						["<Tab>"] = focus_preview,
					},
					i = {
						["<C-u>"] = false,
						["<S-Tab>"] = false,
						["<Tab>"] = focus_preview,
					},
				},
			},
		})
	end,
}
