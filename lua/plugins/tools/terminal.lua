return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            open_mapping = nil,
            hide_numbers = true,
            shade_terminals = true,
            shading_factor = 2,
            start_in_insert = true,
            insert_mappings = false,
            terminal_mappings = false,
            persist_size = true,
            close_on_exit = true,
            shell = vim.o.shell,
            direction = "float",
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            float_opts = {
                border = "curved",
                width = math.floor(vim.o.columns * 0.8),
                height = math.floor(vim.o.lines * 0.8),
            },
        })

        -- Terminal mode keymaps
        vim.api.nvim_create_autocmd("TermOpen", {
            callback = function()
                local opts = { buffer = 0 }
                vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)
                vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
                vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
                vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
                vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
                vim.keymap.set("t", "<C-\\>", "<cmd>lua _FLOAT_TERM_TOGGLE()<cr>", opts)
            end,
        })

        local Terminal = require("toggleterm.terminal").Terminal

        -- ===========================
        -- FLOATING TERMINAL
        -- ===========================
        local float_term = Terminal:new({ direction = "float", hidden = true })
        function _G._FLOAT_TERM_TOGGLE()
            float_term:toggle()
        end

        -- Horizontal terminal (toggleable)
        local horizontal_term = Terminal:new({ direction = "horizontal", hidden = true })
        function _G._HORIZONTAL_TERM_TOGGLE()
            horizontal_term:toggle()
        end

        -- Vertical terminal (toggleable)
        local vertical_term = Terminal:new({ direction = "vertical", hidden = true })
        function _G._VERTICAL_TERM_TOGGLE()
            vertical_term:toggle()
        end

        function _G._TERM_LIST()
            local terms = {
                { name = "float",      term = float_term },
                { name = "horizontal", term = horizontal_term },
                { name = "vertical",   term = vertical_term },
            }
            local msg = "Terminals:\n"
            local any = false
            for _, t in ipairs(terms) do
                if t.term:is_open() then
                    msg = msg .. "  " .. t.name .. " → open\n"
                    any = true
                end
            end
            if not any then
                msg = msg .. "  none open"
            end
            vim.notify(msg, vim.log.levels.INFO)
        end

        -- ===========================
        -- KEYMAPS
        -- ===========================

        -- Floating terminal
        vim.keymap.set("n", "<C-'>", "<cmd>lua _FLOAT_TERM_TOGGLE()<CR>", { desc = "Toggle floating terminal" })

        -- Open NEW terminals (your original behavior)
        vim.keymap.set("n", "<leader>tH", ":botright split | terminal<CR>", { desc = "New horizontal terminal" })
        vim.keymap.set("n", "<leader>tV", ":botright vsplit | terminal<CR>", { desc = "New vertical terminal" })


        vim.keymap.set("n", "<leader>th", "<cmd>lua _HORIZONTAL_TERM_TOGGLE()<CR>",
            { desc = "Toggle horizontal terminal" })
        vim.keymap.set("n", "<leader>tv", "<cmd>lua _VERTICAL_TERM_TOGGLE()<CR>", { desc = "Toggle vertical terminal" })
        vim.keymap.set("n", "<C-`>", "<cmd>lua _HORIZONTAL_TERM_TOGGLE()<CR>", { desc = "Toggle horizontal terminal" })

        -- Show which terminals are open
        vim.keymap.set("n", "<leader>tl", "<cmd>lua _TERM_LIST()<CR>", { desc = "List open terminals" })

        -- Resize splits with Alt
        vim.keymap.set("n", "<A-Up>", ":resize -2<CR>", { desc = "Shrink height" })
        vim.keymap.set("n", "<A-Down>", ":resize +2<CR>", { desc = "Expand height" })
        vim.keymap.set("n", "<A-Left>", ":vertical resize -4<CR>", { desc = "Shrink width" })
        vim.keymap.set("n", "<A-Right>", ":vertical resize +4<CR>", { desc = "Expand width" })
    end,
}
