local function lsp_signature()
    local ok, ls = pcall(require, "lsp_signature")
    if not ok then return "" end

    local sig = ls.status_line(60)
    if not sig or not sig.label or sig.label == "" then return "" end

    local label = sig.label:gsub("\n", " ")

    local max = 48
    if #label > max then
        label = label:sub(1, max - 1) .. "…"
    end

    return "󰊕 " .. label
end

local function selection_count()
    local mode = vim.fn.mode(true)
    if not (mode:find("v") or mode:find("V") or mode:find("\22")) then
        return ""
    end

    local anchor        = vim.fn.getpos("v")
    local cursor        = vim.fn.getpos(".")
    local a_line, a_col = anchor[2], anchor[3]
    local c_line, c_col = cursor[2], cursor[3]

    local start_line    = math.min(a_line, c_line)
    local end_line      = math.max(a_line, c_line)
    local start_col     = math.min(a_col, c_col)
    local end_col       = math.max(a_col, c_col)

    if mode:find("V") then
        local count = 0
        for i = start_line, end_line do
            count = count + #vim.fn.getline(i)
        end
        return " " .. count .. " chars, " .. (end_line - start_line + 1) .. " lines"
    elseif mode:find("\22") then
        local chars = (end_col - start_col + 1) * (end_line - start_line + 1)
        return " " .. chars .. " chars"
    else
        local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
        local count = 0
        if #lines == 1 then
            count = end_col - start_col + 1
        else
            count = #lines[1] - start_col + 1 -- rest of first line
            for i = 2, #lines - 1 do
                count = count + #lines[i] + 1 -- middle lines (+1 for newline)
            end
            count = count + end_col           -- up to cursor on last line
        end
        return " " .. count .. " chars"
    end
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
                lualine_c = {
                    "filename",
                    {
                        lsp_signature,
                        cond = function()
                            return #vim.lsp.get_clients({ bufnr = 0 }) > 0
                        end,
                    },
                },
                lualine_x = { selection_count, "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        })
    end,
}
