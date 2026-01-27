---@diagnostic disable: undefined-global

return {
  -- Gruvbox Material
  {
    "sainnhe/gruvbox-material",
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = "hard" -- soft | medium | hard
      vim.g.gruvbox_material_foreground = "material"
    end,
  },
  -- OneDark
  {
    -- onedark.nvim
    "navarasu/onedark.nvim",
    priority = 900,
    config = function()
      require("onedark").setup({
        style = "warmer",
        -- toggle_style_key = "<leader>ts",
        -- toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'},
      })
    end,
  },
}
