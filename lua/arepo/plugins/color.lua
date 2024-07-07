return {
  "sekke276/dark_flat.nvim",
  config = function()
    require("dark_flat").setup({
      transparent = true,
      italics = true
    })

    -- Line number color
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "white", bold = false })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "white", bold = true })
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "white", bold = false })
  end,
}
