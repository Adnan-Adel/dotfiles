return {
    "romgrk/barbar.nvim",
    dependencies = {
        'lewis6991/gitsigns.nvim',   -- for git status
        'nvim-tree/nvim-web-devicons', -- for file icons
    },
    config = function()
        local map = vim.keymap.set
        local opts = { noremap = true, silent = true }

        -- Move to previous/next
        map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
        map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)

        -- Re-order to previous/next
        map('n', '<A-S-,>', '<Cmd>BufferMovePrevious<CR>', opts)
        map('n', '<A-S-.>', '<Cmd>BufferMoveNext<CR>', opts)

        -- Goto buffer in position...
        for i = 1, 9 do
            map('n', '<A-' .. i .. '>', '<Cmd>BufferGoto ' .. i .. '<CR>', opts)
        end
        map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

        -- Pin/unpin buffer
        map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)

        -- Close buffer
        map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)

        -- Restore buffer
        map('n', '<A-s-c>', '<Cmd>BufferRestore<CR>', opts)

        -- Magic buffer-picking mode
        map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
        map('n', '<C-s-p>', '<Cmd>BufferPickDelete<CR>', opts)

        -- Sort automatically by...
        map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
        map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts)
        map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
        map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
        map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)
    end
}
