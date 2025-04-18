---@diagnostic disable: undefined-global

return{
  {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config=function()
          local builtin = require("telescope.builtin")
          -- Telescope keymaps
          vim.keymap.set("n", "<C-p>", builtin.find_files, { silent = true, desc = "Find files" })
          vim.keymap.set("n", "<C-g>", builtin.live_grep, { silent = true, desc = "Live grep" })
          vim.keymap.set("n", "<C-f>", builtin.current_buffer_fuzzy_find, { silent = true, desc = "Fuzzy find in buffer" })
          vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Find buffers" })
        end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function ()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end
  },
}
