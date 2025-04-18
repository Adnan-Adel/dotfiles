return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<C-\>]], -- Main toggle key
      shade_terminals = true,
      direction = "float", -- default terminal type
      float_opts = {
        border = "rounded",
      },
    })

    -- Map keys to open terminal splits (native way)
    vim.keymap.set("n", "<leader>tv", ":botright vsplit | terminal<CR>", { desc = "Vertical Terminal" })
    vim.keymap.set("n", "<leader>th", ":botright split | terminal<CR>", { desc = "Horizontal Terminal" })

    -- Resize splits easily (Alt + arrow keys)
    vim.keymap.set("n", "<A-Up>",    ":resize -2<CR>", { desc = "Shrink horizontally" })
    vim.keymap.set("n", "<A-Down>",  ":resize +2<CR>", { desc = "Expand horizontally" })
    vim.keymap.set("n", "<A-Left>",  ":vertical resize -4<CR>", { desc = "Shrink vertically" })
    vim.keymap.set("n", "<A-Right>", ":vertical resize +4<CR>", { desc = "Expand vertically" })

    -- Navigate between splits using Ctrl + h/j/k/l
    vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]])
    vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]])
    vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]])
    vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]])

    -- Optional: exit terminal mode with ESC
    vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
  end
}
