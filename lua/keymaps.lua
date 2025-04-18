---@diagnostic disable: undefined-global

vim.keymap.set("n", "<leader>cs", function()
  require("telescope.builtin").colorscheme({ enable_preview = true })
end, { desc = "Choose Colorscheme" })



-- Keymap to toggle line numbers
vim.keymap.set("n", "<leader>n", ":set nu!<CR>", { silent = true, desc = "Toggle line numbers" })
-- Keymap to toggle relative line numbers
vim.keymap.set("n", "<leader>rn", ":set rnu!<CR>", { silent = true, desc = "Toggle relative line numbers" })


-- Toggle fold under cursor
vim.opt.foldmethod = "manual"   -- Set fold method to manual
vim.opt.foldenable = true       -- Enable folding by default
vim.opt.foldlevel = 99          -- Start with all folds open
vim.keymap.set("n", "<leader>z", "za", { desc = "Toggle fold under cursor" }) -- Toggle fold
vim.keymap.set("n", "<leader>o", "zO", { desc = "Open all nested folds" })   -- Open all
vim.keymap.set("n", "<leader>c", "zC", { desc = "Close all nested folds" })  -- Close all


-- Navigating Between Terminals & Windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move right" })



-- Vertical Split for File Opening
vim.keymap.set("n", "<leader>vs", ":vsplit<CR>", { desc = "Open vertical split" })


-- commenting
local map = vim.keymap.set

-- Normal mode: Toggle line comment (gcc)
map("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle comment on current line" })

-- Visual mode: Toggle comment on selection (gc in visual)
map("v", "<leader>/", "<ESC><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { desc = "Toggle comment on selection" })


