return {
    "lervag/vimtex",
    ft = { "tex", "latex" },
    config = function()
        vim.g.vimtex_view_method = "zathura" -- PDF viewer
        vim.g.vimtex_compiler_method = "latexmk"
        vim.g.vimtex_compiler_latexmk = {
            build_dir = "build",
            callback = 1,
            continuous = 1,
            executable = "latexmk",
            options = {
                "-pdf",
                "-shell-escape",
                "-verbose",
                "-file-line-error",
                "-synctex=1",
                "-interaction=nonstopmode",
            },
        }

        -- Keymaps
        vim.keymap.set("n", "<leader>lc", "<cmd>VimtexCompile<cr>", { desc = "LaTeX: Compile" })
        vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<cr>", { desc = "LaTeX: View PDF" })
        vim.keymap.set("n", "<leader>ll", "<cmd>VimtexClean<cr>", { desc = "LaTeX: Clean" })
        vim.keymap.set("n", "<leader>lt", "<cmd>VimtexTocToggle<cr>", { desc = "LaTeX: TOC" })
    end,
}
