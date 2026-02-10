local function selection_count()
    local mode = vim.fn.mode(true)
    if mode:find("v") or mode:find("V") or mode:find("\22") then
        local lines, cols = vim.fn.getpos("."), vim.fn.getpos("v")
        local start_line = math.min(lines[2], cols[2])
        local end_line = math.max(lines[2], cols[2])
        local start_col = math.min(lines[3], cols[3])
        local end_col = math.max(lines[3], cols[3])

        if mode:find("V") then
            -- Visual line mode: count all chars in selected lines
            local count = 0
            for i = start_line, end_line do
                count = count + #vim.fn.getline(i)
            end
            return " " .. count .. " chars, " .. (end_line - start_line + 1) .. " lines"
        elseif mode:find("\22") then
            -- Visual block mode
            local chars = (end_col - start_col + 1) * (end_line - start_line + 1)
            return " " .. chars .. " chars"
        else
            -- Visual character mode
            local buf = vim.fn.bufnr()
            local count = 0
            if start_line == end_line then
                count = end_col - start_col + 1
            else
                count = #vim.fn.getline(start_line) - start_col + 1
                for i = start_line + 1, end_line - 1 do
                    count = count + #vim.fn.getline(i) + 1
                end
                count = count + end_col
            end
            return " " .. count .. " chars"
        end
    end
    return ""
end

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = "auto",
                section_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { "filename" },
                lualine_x = { selection_count, "encoding", "fileformat", "filetype" }, -- ADD selection_count HERE
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        })
    end,
}
