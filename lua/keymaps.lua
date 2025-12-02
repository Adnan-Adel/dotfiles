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


-- Toggle Hex in object files
vim.keymap.set('n', '<leader>hx', ':HexToggle<CR>', { desc = 'Toggle hex view' })


--      Diagnostics Keymaps
-- Show diagnostics in a floating window
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Show diagnostics under cursor" })

-- Jump to previous/next diagnostic
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })

-- Show diagnostics list in quickfix
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- ==============================
--  LSP Navigation
-- ==============================
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Find references" })
vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "Go to type definition" })

-- ==============================
--  LSP Info & Docs
-- ==============================
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover documentation" })
vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })

-- ==============================
--  Refactoring
-- ==============================
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })

-- ==============================
--  Formatting
-- ==============================
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format document" })

-- Duplicate current line
vim.keymap.set("n", "<A-d>", "yyp", { desc = "Duplicate line below" })

-- Move current line up/down
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

