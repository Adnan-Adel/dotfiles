return {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = function()
        vim.fn["mkdp#util#install"]()
    end,
    keys = {
        {
            "<leader>mp",
            "<cmd>Lazy load markdown-preview.nvim | MarkdownPreviewToggle<cr>",
            desc = "Markdown Preview",
        },
    }
}
