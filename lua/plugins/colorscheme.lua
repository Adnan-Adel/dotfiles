---@diagnostic disable: undefined-global

return {
  {
    -- onedark.nvim
    "navarasu/onedark.nvim",
    config = function ()
      require('onedark').setup {
        style = 'warmer',
        -- toggle_style_key = "<leader>ts",
        -- toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'},
      }
      require('onedark').load()
    end
  },

}
