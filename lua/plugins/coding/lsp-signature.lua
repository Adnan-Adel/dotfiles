return {
    "ray-x/lsp_signature.nvim",
    event = "LspAttach",
    opts = {
        bind = true,
        handler_opts = { border = "rounded" },
        floating_window = false,
        floating_window_above_cur_line = true,
        hint_enable = false,
        hint_prefix = "󰊕 ",
        always_trigger = false,
        auto_close_after = nil,
        doc_lines = 0,
        wrap = true,
        hi_parameter = "LspSignatureActiveParameter",
        zindex = 45,
        toggle_key = "<C-/>",
        toggle_key_flip_floatwin_setting = true,
        select_signature_key = "<M-n>",
    },
    config = function(_, opts)
        require("lsp_signature").setup(opts)

        vim.keymap.set({ "n", "i" }, "<Leader>k", vim.lsp.buf.signature_help, {
            silent = true,
            noremap = true,
            desc = "LSP signature help",
        })
    end,
}
