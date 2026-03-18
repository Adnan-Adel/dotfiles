# Adnan's Neovim Configuration

A professional, keyboard-driven Neovim setup for C++, C#, JavaScript, Python, and general text editing.

## Features

- 🚀 **Fast startup** with lazy loading
- 🔍 **Fuzzy finding** (Telescope)
- 🎨 **LSP** for 10+ languages
- 🐛 **Debugging** with DAP
- 📁 **Dual file managers** (Neo-tree + Oil)
- 🗄️ **Database client** (PostgreSQL, MySQL, SQL Server)
- 🤖 **AI assistant** (Claude/ChatGPT integration)
- ⚡ **Auto-format** on save
- 🎯 **Smart text objects**
- 📝 **Code templates**

## Structure
```
lua/
├── core/          # Core Neovim settings
├── config/        # Non-plugin configs (DB, AI keys)
└── plugins/
    ├── editor/    # Text editing (autopairs, commenting)
    ├── coding/    # LSP, completion, debugging
    ├── navigation/# File/buffer navigation
    ├── tools/     # Git, terminal, DB
    ├── ui/        # Appearance
    ├── lang/      # Language-specific
    └── extras/    # Optional features
```

## Installation

### Prerequisites
```bash
sudo apt install neovim ripgrep fd-find fzf nodejs npm gcc python3-pip \
    zathura sxiv poppler-utils
```

### Install Config
```bash
git clone https://github.com/Adnan-Adel/dotfiles ~/.config/nvim
nvim  # Will auto-install plugins
```

## Key Mappings

### Navigation
- `<C-e>` - Toggle file tree
- `-` - Open Oil file manager
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>fp` - Find projects

### Editing
- `<leader>ca` - Code actions
- `gd` - Go to definition
- `gr` - Show references
- `<leader>rn` - Rename symbol
- `di"` - Delete inside quotes
- `ci(` - Change inside parens

### Windows
- `<C-h/j/k/l>` - Navigate windows
- `<leader>vs` - Vertical split
- `<leader>hs` - Horizontal split

### Terminal
- `<C-\>` - Toggle floating terminal
- `<leader>th` - Horizontal terminal
- `<leader>tv` - Vertical terminal

### Git
- `<leader>gs` - Git status
- `]h / [h` - Next/prev hunk
- `<leader>hp` - Preview hunk

### Database
- `<leader>db` - Toggle DB UI
- `]p / [p` - Navigate PDF pages

### LSP/Diagnostics
- `gl` - Show diagnostic
- `[d / ]d` - Prev/next diagnostic
- `K` - Hover docs
- `<leader>f` - Format file

## Languages Supported

- C/C++ (clangd)
- C# (omnisharp)
- JavaScript/TypeScript (ts_ls)
- Python (pyright)
- Rust (rust-analyzer)
- Go (gopls)
- Lua (lua_ls)

## Customization

### Change Colorscheme
Edit `lua/plugins/ui/colorscheme.lua`

### Add Database Connection
Edit `lua/config/databases.lua`

### Modify Keymaps
Edit `lua/core/keymaps.lua`

## Troubleshooting

### LSP not working
```vim
:LspInfo  # Check if attached
:LspRestart  # Restart LSP
```

### Plugins not loading
```vim
:Lazy sync  # Sync plugins
:Lazy clean  # Remove unused
```

### Format not working
```vim
:ConformInfo  # Check formatter
```
