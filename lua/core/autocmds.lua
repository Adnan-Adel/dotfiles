local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
augroup('highlight-yank', { clear = true })
autocmd('TextYankPost', {
    group = 'highlight-yank',
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Fix .h files being treated as C++ (set to C)
autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.h",
    callback = function()
        vim.bo.filetype = "c"
    end,
})

-- Auto-reload files changed outside Neovim
autocmd("FileChangedShellPost", {
    pattern = "*",
    callback = function()
        vim.notify("File changed on disk. Buffer reloaded.", vim.log.levels.INFO)
    end
})

-- Remember cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Auto-format on save (with file type control)
augroup("format-on-save", { clear = true })
autocmd("BufWritePre", {
    group = "format-on-save",
    callback = function()
        local bufname = vim.api.nvim_buf_get_name(0)
        if bufname == "" then
            return
        end

        -- Excluded directories
        local exclude = {
            "node_modules",
            "vendor",
            "dist",
            "build",
            "target",
            "obj",
            "bin",
            ".git",
            ".cache",
            ".next",
            ".nuxt",
            ".output",
            ".idea",
            ".vscode",
        }

        for _, dir in ipairs(exclude) do
            if bufname:match("/" .. dir .. "/") then
                return
            end
        end

        -- Only format if LSP is attached
        if next(vim.lsp.get_active_clients({ bufnr = 0 })) == nil then
            return
        end

        vim.lsp.buf.format({
            timeout_ms = 2000,
        })
    end,
})
