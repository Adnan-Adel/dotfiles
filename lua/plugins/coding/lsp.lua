vim.deprecate = function() end -- Suppress deprecation warnings
return {
    -- Mason: LSP installer
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })
        end,
    },

    -- Mason LSP Config bridge
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                    "ts_ls",
                    "eslint",
                    "tailwindcss",
                    "html",
                    "cssls",
                    "gopls",
                    "rust_analyzer",
                    "pyright",
                    "omnisharp",
                },
                automatic_installation = true,
            })
        end,
    },

    -- LSP Configuration
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local lspconfig = require("lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")

            local capabilities = cmp_nvim_lsp.default_capabilities()

            local on_attach = function(client, bufnr)
                -- Disable clangd format-on-type / auto formatting
                if client.name == "clangd" then
                    client.server_capabilities.documentFormattingProvider = false
                end

                local opts = { buffer = bufnr, silent = true }

                -- Keybindings
                vim.keymap.set("n", "<space>K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<space>gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "<space>gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>f", function()
                    vim.lsp.buf.format({ async = true })
                end, opts)

                -- Diagnostic keymaps
                vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
                vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
                vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
                vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
            end

            -- Diagnostic configuration
            vim.diagnostic.config({
                virtual_text = false,
                signs = true,
                update_in_insert = false,
                underline = true,
                severity_sort = true,
                float = {
                    border = "rounded",
                    source = "always",
                },
            })

            -- Diagnostic signs
            local signs = { Error = "●", Warn = "●", Hint = "●", Info = "●" }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end

            -- Default server configuration
            local default_config = {
                capabilities = capabilities,
                on_attach = on_attach,
            }

            -- -- Simple servers (use defaults)
            -- local simple_servers = {
            --     "lua_ls",
            --     "ts_ls",
            --     "gopls",
            --     "rust_analyzer",
            --     "pyright",
            -- }
            --
            -- for _, server in ipairs(simple_servers) do
            --     lspconfig[server].setup(default_config)
            -- end
        end,
    },
}
