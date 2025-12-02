---@diagnostic disable: undefined-global

return{
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config=function ()
     require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    })
    vim.keymap.set('n', '<C-e>', ':Neotree toggle left<CR>', { desc = "Toggle Neo-tree" })
  end
}
