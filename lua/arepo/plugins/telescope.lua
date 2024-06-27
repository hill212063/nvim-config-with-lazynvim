return {
  "nvim-telescope/telescope.nvim",
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
    vim.keymap.set("n", "<leader>vff", builtin.current_buffer_fuzzy_find, { desc = "Telescope Current Buffer Fuzzy Find" })

    -- Neovim LSP Pickers
    vim.keymap.set("n", "<leader>lr", builtin.lsp_references, { desc = "Telescope LSP References" })
    vim.keymap.set("n", "<leader>lic", builtin.lsp_incoming_calls, { desc = "Telescope LSP Incoming Calls" })
    vim.keymap.set("n", "<leader>loc", builtin.lsp_outgoing_calls, { desc = "Telescope LSP Outgoing Calls" })
    vim.keymap.set("n", "<leader>lds", builtin.lsp_document_symbols, { desc = "Telescope LSP Document Symbols" })
    vim.keymap.set("n", "<leader>lws", builtin.lsp_workspace_symbols, { desc = "Telescope LSP Workspace Symbols" })
    vim.keymap.set("n", "<leader>ldws", builtin.lsp_dynamic_workspace_symbols,
      { desc = "Telescope LSP Dynamic Workspace Symbols" })
    vim.keymap.set("n", "<leader>ld", builtin.diagnostics, { desc = "Telescope Diagnostics" })
    vim.keymap.set("n", "<leader>lgi", builtin.lsp_implementations, { desc = "Telescope LSP Implementations" })
    vim.keymap.set("n", "<leader>lgd", builtin.lsp_definitions, { desc = "Telescope LSP Definitions" })
    vim.keymap.set("n", "<leader>ltd", builtin.lsp_type_definitions, { desc = "Telescope LSP Type Definitions" })

    -- Git Pickers
    vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Telescope Git Commits" })
    vim.keymap.set("n", "<leader>gbc", builtin.git_bcommits, { desc = "Telescope Git BCommits" })
    vim.keymap.set("n", "<leader>gbr", builtin.git_bcommits_range, { desc = "Telescope Git BCommits Range" })
    vim.keymap.set("n", "<leader>gs", builtin.git_stash, { desc = "Telescope Git Stash" })
    vim.keymap.set("n", "<leader>gss", builtin.git_status, { desc = "Telescope Git Status" })
    vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Telescope Git Branches" })
  end,
}, {
  "nvim-telescope/telescope-ui-select.nvim",
  config = function()
    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
      },
    })
    require("telescope").load_extension("ui-select")
  end,
}
