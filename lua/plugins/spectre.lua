return {
    "nvim-pack/nvim-spectre",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("spectre").setup()

        vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', { desc = "Toggle spectre (find & replace)" })
        vim.keymap.set("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', { desc = "Search current word" })
        vim.keymap.set("v", "<leader>S", '<cmd>lua require("spectre").open_visual()<CR>', { desc = "Search selection" })
    end
}
