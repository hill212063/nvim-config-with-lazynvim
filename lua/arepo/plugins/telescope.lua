return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local builtin = require("telescope.builtin")

    -- File Pickers
    vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>fs", builtin.grep_string, {})

    -- Vim Pickers
    vim.keymap.set("n", "<leader>vb", builtin.buffers, {})
    vim.keymap.set("n", "<leader>vs", builtin.search_history, {})
    vim.keymap.set("n", "<leader>vr", builtin.registers, {})
    vim.keymap.set("n", "<leader>vk", builtin.keymaps, {})
    vim.keymap.set("n", "<leader>vss", builtin.spell_suggest, {})
    vim.keymap.set("n", "<leader>vft", builtin.filetypes, {})
    vim.keymap.set("n", "<leader>vff", builtin.current_buffer_fuzzy_find, {})

    -- Neovim LSP Pickers
    vim.keymap.set("n", "<leader>lr", builtin.lsp_references, {})
    vim.keymap.set("n", "<leader>lic", builtin.lsp_incoming_calls, {})
    vim.keymap.set("n", "<leader>loc", builtin.lsp_outgoing_calls, {})
    vim.keymap.set("n", "<leader>lds", builtin.lsp_document_symbols, {})
    vim.keymap.set("n", "<leader>lws", builtin.lsp_workspace_symbols, {})
    vim.keymap.set("n", "<leader>ldws", builtin.lsp_dynamic_workspace_symbols, {})
    vim.keymap.set("n", "<leader>ld", builtin.diagnostics, {})
    vim.keymap.set("n", "<leader>lgi", builtin.lsp_implementations, {})
    vim.keymap.set("n", "<leader>lgd", builtin.lsp_definitions, {})
    vim.keymap.set("n", "<leader>ltd", builtin.lsp_type_definitions, {})

    -- Git Pickers
    vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
    vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})
    vim.keymap.set("n", "<leader>gbc", builtin.git_bcommits, {})
    vim.keymap.set("n", "<leader>gbr", builtin.git_bcommits_range, {})
    vim.keymap.set("n", "<leader>gs", builtin.git_stash, {})
    vim.keymap.set("n", "<leader>gss", builtin.git_status, {})
    vim.keymap.set("n", "<leader>gb", builtin.git_branches, {})
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
