---@diagnostic disable: undefined-global

return {
    -- Gruber Darker
    {
        "blazkowolf/gruber-darker.nvim",
        priority = 1000,
        config = function()
            require("gruber-darker").setup({
                bold = true,
                italic = {
                    strings = false,
                    comments = true,
                    operators = false,
                    folds = true,
                },
                underline = true,
                undercurl = true,
                invert = {
                    signs = false,
                    tabline = false,
                    visual = false,
                },
                contrast = "hard", -- soft | medium | hard
            })

            -- vim.cmd.colorscheme("gruber-darker")
        end,
    },
    -- Gruvbox Material
    {
        "sainnhe/gruvbox-material",
        priority = 1000,
        config = function()
            vim.g.gruvbox_material_background = "hard" -- soft | medium | hard
            vim.g.gruvbox_material_foreground = "material"
            -- set a default color scheme
            vim.cmd("colorscheme gruvbox-material")
            -- vim.cmd("colorscheme default")
        end,
    },

    -- GitHub theme (github_light, github_dark, github_dark_dimmed)
    {
        "projekt0n/github-nvim-theme",
        name = "github-theme",
        priority = 1000,
        config = function()
            require("github-theme").setup({
                options = {
                    transparent = false,
                    styles = {
                        comments = "italic",
                        keywords = "bold",
                        functions = "NONE",
                        variables = "NONE",
                    },
                },
            })

            -- vim.cmd("colorscheme github_dark_dimmed")
        end,
    },

    -- OneDark (nice dark fallback)
    {
        "navarasu/onedark.nvim",
        priority = 900,
        config = function()
            require("onedark").setup({
                style = "warmer",
                transparent = false,
            })
            -- vim.cmd("colorscheme onedark")
        end,
    },

}
