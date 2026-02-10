return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    keys = {
        { "<C-e>",      "<cmd>Neotree toggle<cr>",     desc = "Toggle file tree" },
        { "<leader>ge", "<cmd>Neotree git_status<cr>", desc = "Git status" },
        { "<leader>be", "<cmd>Neotree buffers<cr>",    desc = "Buffer explorer" },
    },
    opts = {
        close_if_last_window = true,
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,

        default_component_configs = {
            indent = {
                with_markers = true,
                indent_marker = "│",
                last_indent_marker = "└",
            },
            git_status = {
                symbols = {
                    added = "✚",
                    modified = "",
                    deleted = "✖",
                    renamed = "➜",
                    untracked = "",
                    ignored = "",
                    unstaged = "✗",
                    staged = "✓",
                    conflict = "",
                },
            },
        },

        window = {
            position = "left",
            width = 35,
            mappings = {
                ["<space>"] = "toggle_node",
                ["<cr>"] = "open",
                ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
                ["s"] = "open_vsplit",
                ["S"] = "open_split",
                ["t"] = "open_tabnew",
                ["w"] = "open_with_window_picker",
                ["C"] = "close_node",
                ["z"] = "close_all_nodes",
                ["Z"] = "expand_all_nodes",
                --------------
                ["a"] = "add",
                ["A"] = "add_directory",
                ["d"] = "delete",
                ["r"] = "rename",
                ["y"] = "copy_to_clipboard",
                ["x"] = "cut_to_clipboard",
                ["p"] = "paste_from_clipboard",
                ["c"] = "copy",
                ["m"] = "move",
                ---------------
                ["q"] = "close_window",
                ["R"] = "refresh",
                ["?"] = "show_help",
                ["<bs>"] = "navigate_up",
                ["."] = "set_root",
                ["H"] = "toggle_hidden",
            },
        },

        filesystem = {
            filtered_items = {
                visible = true,
                hide_dotfiles = false,
                hide_gitignored = false,
            },
            follow_current_file = {
                enabled = true,
            },
            use_libuv_file_watcher = true,
        },
    },
}
