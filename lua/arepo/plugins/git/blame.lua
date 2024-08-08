return {
  "FabijanZulj/blame.nvim",
  config = function()
    require("blame").setup()
    vim.keymap.set("n", "<leader>tb", vim.cmd.BlameToggle, { desc = "Toggle git blame" })
  end,
}
