return {
  {
    -- mason
      "williamboman/mason.nvim",
      config = function ()
        require("mason").setup()
      end
  },
  {
    -- mason-lspconfig
      "williamboman/mason-lspconfig.nvim",
      config = function ()
        require("mason-lspconfig").setup({
          ensure_installed = { "lua_ls", "clangd", "ts_ls", "gopls"},
        })
      end
  },
  {
    -- nvim-lspconfig
    "neovim/nvim-lspconfig",
    config = function ()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.clangd.setup({
        capabilities = capabilities
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities
      })
      lspconfig = require('lspconfig')
      lspconfig.gopls.setup({
        capabilities = capabilities
      })

      -- keymaps
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
