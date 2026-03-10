return {
    "ahmedkhalf/project.nvim",
    config = function()
        require("project_nvim").setup({
            detection_methods = { "pattern", ".git" },
            patterns = { ".git", "Makefile", "package.json", "Cargo.toml", "go.mod" },
        })

        require("telescope").load_extension("projects")

        vim.keymap.set("n", "<leader>fp", "<cmd>Telescope projects<cr>", { desc = "Find projects" })
    end,
}
