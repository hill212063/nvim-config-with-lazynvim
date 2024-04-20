return {
  'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    opts = {
      animation = true,
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released

    init = function()
    vim.g.barbar_auto_setup = false
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    -- Move to previous/next
    map('n', '<leader>b,', '<Cmd>BufferPrevious<CR>', opts)
    map('n', '<leader>b.', '<Cmd>BufferNext<CR>', opts)
    -- Re-order to previous/next
    map('n', '<leader>b<', '<Cmd>BufferMovePrevious<CR>', opts)
    map('n', '<leader>b>', '<Cmd>BufferMoveNext<CR>', opts)
    -- Goto buffer in position...
    map('n', '<leader>b1', '<Cmd>BufferGoto 1<CR>', opts)
    map('n', '<leader>b2', '<Cmd>BufferGoto 2<CR>', opts)
    map('n', '<leader>b3', '<Cmd>BufferGoto 3<CR>', opts)
    map('n', '<leader>b4', '<Cmd>BufferGoto 4<CR>', opts)
    map('n', '<leader>b5', '<Cmd>BufferGoto 5<CR>', opts)
    map('n', '<leader>b6', '<Cmd>BufferGoto 6<CR>', opts)
    map('n', '<leader>b7', '<Cmd>BufferGoto 7<CR>', opts)
    map('n', '<leader>b8', '<Cmd>BufferGoto 8<CR>', opts)
    map('n', '<leader>b9', '<Cmd>BufferGoto 9<CR>', opts)
    map('n', '<leader>b0', '<Cmd>BufferLast<CR>', opts)
    -- Pin/unpin buffer
    map('n', '<leader>bp', '<Cmd>BufferPin<CR>', opts)
    -- Close buffer
    map('n', '<leader>bc', '<Cmd>BufferClose<CR>', opts)
    -- Wipeout buffer
    --                 :BufferWipeout
    -- Close commands
    --                 :BufferCloseAllButCurrent
    --                 :BufferCloseAllButPinned
    --                 :BufferCloseAllButCurrentOrPinned
    --                 :BufferCloseBuffersLeft
    --                 :BufferCloseBuffersRight
    -- Magic buffer-picking mode
    map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
    -- Sort automatically by...
    map('n', '<leader>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
    map('n', '<leader>bn', '<Cmd>BufferOrderByName<CR>', opts)
    map('n', '<leader>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
    map('n', '<leader>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
    map('n', '<leader>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

    end
}
