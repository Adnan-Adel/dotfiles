-- Global Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- UI / Numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorcolumn = false
vim.opt.termguicolors = true
vim.opt.scrolloff = 25
vim.opt.cmdheight = 0
vim.opt.signcolumn = "yes"
-- vim.opt.colorcolumn = "80"

-- Indentation
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Behavior
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("config") .. "/undo"
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.background = "dark"

-- Wrapping behavior
vim.opt.whichwrap:append("<,>,h,l,[,]")

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = false

-- Split windows
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Performance
vim.opt.updatetime = 50

-- Path for gf command
vim.opt.path:append(".,**")
vim.opt.path:append("/usr/include/**")
vim.opt.path:append("/usr/include/c++/**")

--[[ ---------- My Keymap Reference --------------------
```
WINDOWS:
<C-h/j/k/l>     → Navigate windows
<C-Up/Down>     → Resize height
<C-Left/Right>  → Resize width
<leader>vs      → Vertical split
<leader>hs      → Horizontal split

QUICKFIX:
]q / [q         → Next/Previous quickfix
]l / [l         → Next/Previous location list
<leader>qo      → Open quickfix window
<leader>qc      → Close quickfix window

DIAGNOSTICS:
[d / ]d         → Previous/Next diagnostic
gl              → Show diagnostic float
<leader>q       → Send diagnostics to location list

EDITING:
<leader>w       → Save
<leader>Q       → Quit (capital Q!)
J/K (visual)    → Move lines up/down
< / > (visual)  → Indent left/right

SEARCH:
<Esc>           → Clear search highlight
n / N           → Next/Prev (centered)

FOLDING:
<leader>z       → Toggle fold
<leader>fo      → Open all folds
<leader>fc      → Close all folds
]]
