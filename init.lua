---@diagnostic disable: undefined-global

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- load core configs
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- setup plugins
require("lazy").setup({
    { import = "plugins" },
    { import = "plugins.completion" },
    { import = "plugins.ui" },
})
