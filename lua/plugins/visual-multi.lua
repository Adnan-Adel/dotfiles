return {
    "mg979/vim-visual-multi",
    branch = "master",
    init = function()
        vim.g.VM_default_mappings = 0 -- we control everything

        vim.g.VM_maps = {
            -- Core
            ["Find Under"]         = "<C-n>", -- next occurrence
            ["Find Subword Under"] = "<C-n>",
            ["Select All"]         = "<C-z>", -- select ALL occurrences (instant)
            ["Visual All"]         = "<C-z>", -- visual → all
            ["Skip Region"]        = "<C-x>",
            ["Remove Region"]      = "<C-p>",

            -- Cursor control
            ["Add Cursor Down"]    = "<C-j>",
            ["Add Cursor Up"]      = "<C-k>",

            -- Navigation between cursors
            ["Next"]               = "]m",
            ["Prev"]               = "[m",

            -- Exit
            ["Exit"]               = "<Esc>",
        }

        -- Visual polish
        vim.g.VM_theme = "iceblue"
        vim.g.VM_highlight_matches = "underline"
        vim.g.VM_set_statusline = 0
    end,
}
