return {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("illuminate").configure({
            providers = { "lsp", "treesitter", "regex" },
            delay = 100,
            filetypes_denylist = {
                "neo-tree",
                "Trouble",
                "alpha",
                "dashboard",
            },
            under_cursor = true,
            min_count_to_highlight = 2,
        })
    end,
}
