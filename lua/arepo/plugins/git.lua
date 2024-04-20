return {
  "tpope/vim-fugitive",
  "FabijanZulj/blame.nvim",
  "rbong/vim-flog",
  "lewis6991/gitsigns.nvim",
  lazy = true,
  cmd = { "Flog", "Flogsplit", "Floggit" },
  dependencies = {
    "tpope/vim-fugitive",
  },
}
