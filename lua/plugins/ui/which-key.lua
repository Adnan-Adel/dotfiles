return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {
        preset = "modern",
        icons = {
            breadcrumb = "»",
            separator = "➜",
            group = "+",
        },
        win = {
            border = "rounded",
            padding = { 1, 2 },
            wo = {
                winblend = 0,
            },
        },
        layout = {
            height = { min = 4, max = 25 },
            width = { min = 20, max = 50 },
            spacing = 3,
            align = "left",
        },
        plugins = {
            marks = true,
            registers = true,
            spelling = {
                enabled = true,
                suggestions = 20,
            },
            presets = {
                operators = false,
                motions = false,
                text_objects = false,
                windows = true,
                nav = true,
                z = true,
                g = true,
            },
        },
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)

        -- Register leader key groups
        wk.add({
            { "<leader>f", group = "find" },
            { "<leader>g", group = "git" },
            { "<leader>t", group = "terminal/toggle" },
            { "<leader>d", group = "diagnostics/debug/database" },
            { "<leader>b", group = "buffer" },
            { "<leader>w", group = "window" },
            { "<leader>c", group = "code" },
            { "<leader>l", group = "latex/lsp" },
            { "<leader>o", group = "open" },
            { "<leader>p", group = "pdf/project" },
            { "<leader>q", group = "quickfix" },
            { "<leader>r", group = "rename/reload" },
            { "<leader>s", group = "search/substitute" },
            { "<leader>x", group = "trouble/hex" },
            { "<leader>h", group = "git-hunk" }, -- NEW: For gitsigns
        })
    end,
}
