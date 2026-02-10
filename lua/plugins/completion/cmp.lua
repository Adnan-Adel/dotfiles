return {
    -- Completion sources
    { "hrsh7th/cmp-nvim-lsp" }, -- LSP completions
    { "hrsh7th/cmp-buffer" },   -- Buffer completions
    { "hrsh7th/cmp-path" },     -- Path completions
    { "hrsh7th/cmp-cmdline" },  -- Command line completions

    -- Snippet engine
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },

    -- Main completion plugin
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            -- Load VSCode-style snippets
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },

                -- Completion window styling
                window = {
                    completion = {
                        border = "rounded",
                        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
                        col_offset = -3,
                        side_padding = 1,
                    },
                    documentation = {
                        border = "rounded",
                        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
                    },
                },

                -- Key mappings
                mapping = cmp.mapping.preset.insert({
                    -- Scroll documentation
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),

                    -- Trigger completion menu
                    ["<C-Space>"] = cmp.mapping.complete(),

                    -- Close completion menu
                    ["<C-e>"] = cmp.mapping.abort(),

                    -- Confirm selection
                    ["<CR>"] = cmp.mapping.confirm({ select = false }),

                    -- Navigate through completion items
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),

                -- Completion sources (order matters - higher priority first)
                sources = cmp.config.sources({
                    { name = "nvim_lsp", priority = 1000 },
                    { name = "luasnip",  priority = 750 },
                    { name = "buffer",   priority = 500 },
                    { name = "path",     priority = 250 },
                }),

                -- Formatting
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, item)
                        local icons = {
                            Text = "󰉿",
                            Method = "󰆧",
                            Function = "󰊕",
                            Constructor = "",
                            Field = "󰜢",
                            Variable = "󰀫",
                            Class = "󰠱",
                            Interface = "",
                            Module = "",
                            Property = "󰜢",
                            Unit = "󰑭",
                            Value = "󰎠",
                            Enum = "",
                            Keyword = "󰌋",
                            Snippet = "",
                            Color = "󰏘",
                            File = "󰈙",
                            Reference = "󰈇",
                            Folder = "󰉋",
                            EnumMember = "",
                            Constant = "󰏿",
                            Struct = "󰙅",
                            Event = "",
                            Operator = "󰆕",
                            TypeParameter = "",
                        }

                        item.kind = string.format("%s %s", icons[item.kind] or "", item.kind)
                        item.menu = ({
                            nvim_lsp = "[LSP]",
                            luasnip = "[Snippet]",
                            buffer = "[Buffer]",
                            path = "[Path]",
                        })[entry.source.name]

                        return item
                    end,
                },

                -- Experimental features
                experimental = {
                    ghost_text = false, -- Show ghost text for completion
                },
            })

            -- Command line completions
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                    { name = "cmdline" },
                }),
            })

            -- Search completions
            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            })
        end,
    },
}
