---@diagnostic disable: undefined-global


return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  config = function()
    vim.o.foldcolumn = '1'  -- Show fold column
    vim.o.foldlevel = 99    -- Ensure folds are open
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    require('ufo').setup()
  end
}
