return{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

  config=function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {
        "c",
        "cpp",
        "lua",
        "javascript",
      },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      -- This enables automatic installation when a file with an unsupported language is opened
      auto_install = true,

      -- List of parsers to ignore installing (or "all")
      ignore_install = { },

      highlight = { enable = true },
      indent = {enable = true },
    })
  end,
}
