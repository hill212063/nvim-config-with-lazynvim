return {
  "daschw/leaf.nvim",
  config = function()
    require("leaf").setup({
      underlineStyle = "underline",
      commentStyle = "italic",
      functionStyle = "NONE",
      keywordStyle = "italic",
      statementStyle = "bold",
      typeStyle = "NONE",
      variablebuiltinStyle = "italic",
      transparent = true,
      colors = {},
      theme = "dark",   -- default, based on vim.o.background, alternatives: "light", "dark"
      contrast = "low", -- default, alternatives: "medium", "high"
      overrides = {
        Comment = { style = "italic" },
        TelescopeBorder = { link = "Normal" },
      },
    })

    -- setup must be called before loading
    vim.cmd("colorscheme leaf")
  end,
}
