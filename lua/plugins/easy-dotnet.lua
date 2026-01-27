return {
  "GustavEikaas/easy-dotnet.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("easy-dotnet").setup({
      lsp = {
        enabled = false,
      },

      package_completion = {
        enabled = true,
      },

      picker = "basic",

      diagnostics = {
        default_severity = "error",
      },
    })
  end,
}
