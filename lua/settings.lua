-- Enable relative line numbering by default
vim.opt.number = true        -- Enable absolute line numbers
vim.opt.relativenumber = true -- Enable relative line numbers

-- enable a brief highlight when copying
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})



-- Use system clipboard by default
vim.opt.clipboard = "unnamedplus"



-- setting colorscheme
-- vim.cmd("colorscheme sorbet")


-- Enable presistent undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("config") .. "/undo"


vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.h",
  callback = function()
    vim.bo.filetype = "c"
  end,
})

-- colors
vim.opt.termguicolors = true


-- auto-reload files if they’ve been changed outside of Neovim
vim.api.nvim_create_autocmd("FileChangedShellPost", {
  pattern = "*",
  callback = function()
    vim.notify("File changed on disk. Buffer reloaded.", vim.log.levels.INFO)
  end
})

