local keymap = vim.keymap.set

-- General
keymap("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear search highlight" })
keymap("n", "<Esc>", ":noh<CR>", { desc = "Clear search highlight" })

-- Pane Navigation (Window management)
keymap("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to bottom window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to top window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Quickfix navigation (FIXED - no conflicts now!)
keymap("n", "]q", "<cmd>cnext<CR>zz", { desc = "Next quickfix" })
keymap("n", "[q", "<cmd>cprev<CR>zz", { desc = "Previous quickfix" })
keymap("n", "]l", "<cmd>lnext<CR>zz", { desc = "Next location list" })
keymap("n", "[l", "<cmd>lprev<CR>zz", { desc = "Previous location list" })
keymap("n", "<leader>qo", "<cmd>copen<CR>", { desc = "Open quickfix" })
keymap("n", "<leader>qc", "<cmd>cclose<CR>", { desc = "Close quickfix" })

-- Resize windows
keymap("n", "<C-Up>", ":resize -2<CR>", { desc = "Decrease height" })
keymap("n", "<C-Down>", ":resize +2<CR>", { desc = "Increase height" })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease width" })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase width" })

-- Window Splitting
keymap("n", "<leader>vs", ":vsplit<CR>", { desc = "Vertical split" })
keymap("n", "<leader>hs", ":split<CR>", { desc = "Horizontal split" })

-- Move text up and down in visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Better paste (doesn't replace clipboard)
keymap("x", "<leader>p", [["_dP]], { desc = "Paste without yanking" })

-- Keep cursor centered when scrolling
keymap("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
keymap("n", "n", "nzzzv", { desc = "Next search result centered" })
keymap("n", "N", "Nzzzv", { desc = "Previous search result centered" })

-- Quick save and quit
keymap("n", "<leader>w", ":w<CR>", { desc = "Save file" })
keymap("n", "<leader>Q", ":q<CR>", { desc = "Quit" })  -- Changed from <leader>q to <leader>Q

-- Better indenting
keymap("v", "<", "<gv", { desc = "Indent left" })
keymap("v", ">", ">gv", { desc = "Indent right" })

-- UI Toggles
keymap("n", "<leader>n", ":set nu!<CR>", { desc = "Toggle line numbers" })
keymap("n", "<leader>Rn", ":set rnu!<CR>", { desc = "Toggle relative numbers" })

-- Folding
vim.opt.foldmethod = "manual"
vim.opt.foldenable = true
vim.opt.foldlevel = 99
keymap("n", "<leader>z", "za", { desc = "Toggle fold" })
keymap("n", "<leader>fo", "zO", { desc = "Open all folds" })
keymap("n", "<leader>fc", "zC", { desc = "Close all folds" })

-- Diagnostics (Errors/Warnings)
keymap("n", "gl", vim.diagnostic.open_float, { desc = "LSP: Show diagnostic error" })
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "LSP: Previous error" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "LSP: Next error" })
keymap("n", "<leader>q", vim.diagnostic.setloclist, { desc = "LSP: Open diagnostic list" })


-- Quick select all
keymap("n", "<C-;>", "ggVG", { desc = "Select all"})

-- Better search and replace
keymap("n", "<leader>sr", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "Search and replace word under cursor" })
keymap("v", "<leader>sr", '"hy:%s/<C-r>h/<C-r>h/gc<left><left><left>', { desc = "Search and replace selection" })

-- Quick select inside/around
keymap("n", "<leader>v", "viw", { desc = "Select word" })
keymap("n", "<leader>V", "viW", { desc = "Select WORD" })

-- Duplicate line/selection
keymap("n", "<leader>d", "yyp", { desc = "Duplicate line" })
keymap("v", "<leader>d", "y`>p", { desc = "Duplicate selection" })

-- Delete without yanking
keymap({ "n", "v" }, "<leader>x", '"_d', { desc = "Delete without yanking" })
keymap("n", "<leader>X", '"_dd', { desc = "Delete line without yanking" })

-- Change without yanking
keymap({ "n", "v" }, "<leader>c", '"_c', { desc = "Change without yanking" })

-- select last pasted/changed text
keymap("n", "gp", "`[v`]", { desc = "Select last paste" })

-- search for visually selected text
keymap("v", "//", 'y/\\V<C-R>=escape(@",\'/\\\')<CR><CR>', { desc = "Search selection" })


-- reload nvim



-- Database UI
vim.keymap.set("n", "<leader>db", "<cmd>DBUIToggle<CR>",
    { desc = "Toggle DB UI" })

vim.keymap.set("n", "<leader>dq", "<cmd>DB<CR>",
    { desc = "Run DB query" })


-- Quick compile/run
keymap("n", "<F5>", function()
  -- Save all files first
  vim.cmd("wall")
  
  -- Detect project type and run appropriate command
  if vim.fn.filereadable("Makefile") == 1 then
    vim.cmd("!make")
  elseif vim.fn.filereadable("Cargo.toml") == 1 then
    vim.cmd("!cargo build")
  elseif vim.fn.filereadable("package.json") == 1 then
    vim.cmd("!npm run build")
  elseif vim.fn.filereadable("go.mod") == 1 then
    vim.cmd("!go build")
  else
    vim.notify("No build system detected", vim.log.levels.WARN)
  end
end, { desc = "Build project" })

-- Quick run
keymap("n", "<F6>", function()
  local ft = vim.bo.filetype
  if ft == "python" then
    vim.cmd("!python3 %")
  elseif ft == "javascript" or ft == "typescript" then
    vim.cmd("!node %")
  elseif ft == "c" or ft == "cpp" then
    vim.cmd("!./%:r")
  elseif ft == "rust" then
    vim.cmd("!cargo run")
  elseif ft == "go" then
    vim.cmd("!go run %")
  end
end, { desc = "Run current file" })


-- Emacs-style window management
keymap("n", "<C-x>2", ":split<CR>", { desc = "Split horizontal" })
keymap("n", "<C-x>3", ":vsplit<CR>", { desc = "Split vertical" })
keymap("n", "<C-x>0", ":close<CR>", { desc = "Close window" })
keymap("n", "<C-x>1", ":only<CR>", { desc = "Close other windows" })
keymap("n", "<C-x>o", "<C-w>w", { desc = "Next window" })




-- ╔═══════════════════════════════════════════════════╗
-- ║              NEOVIM CHEATSHEET                    ║
-- ╠═══════════════════════════════════════════════════╣
-- ║ SELECTION                                         ║
-- ║ <C-a>        Select all                           ║
-- ║ <leader>v    Select word                          ║
-- ║ viw/vaw      Visual word                          ║
-- ║ vi"/va"      Visual quotes                        ║
-- ╠═══════════════════════════════════════════════════╣
-- ║ EDITING                                           ║
-- ║ <leader>d    Duplicate                            ║
-- ║ <leader>x    Delete (no yank)                     ║
-- ║ <leader>p    Paste (no yank)                      ║
-- ║ J/K (vis)    Move lines                           ║
-- ╠═══════════════════════════════════════════════════╣
-- ║ SEARCH & REPLACE                                  ║
-- ║ <leader>sr   Replace word/selection               ║
-- ║ //  (vis)    Search selection                     ║
-- ║ <Esc>        Clear highlight                      ║
-- ╠═══════════════════════════════════════════════════╣
-- ║ LSP                                               ║
-- ║ gl           Show error                           ║
-- ║ [d / ]d      Prev/next error                      ║
-- ║ <leader>rn   Rename                               ║
-- ║ gd           Go to definition                     ║
-- ╠═══════════════════════════════════════════════════╣
-- ║ WINDOWS                                           ║
-- ║ <C-h/j/k/l>  Navigate                             ║
-- ║ <leader>vs   Vertical split                       ║
-- ║ <C-Up/Down>  Resize                               ║ 
-- ╠═══════════════════════════════════════════════════╣
-- ║ QUICKFIX                                          ║
-- ║ ]q / [q      Next/prev item                       ║
-- ║ <leader>qo   Open quickfix                        ║
-- ╚═══════════════════════════════════════════════════╝
