# charVim Wiki

A personal Neovim configuration running on **Neovim v0.11.6** with LuaJIT, managed by [lazy.nvim](https://github.com/folke/lazy.nvim).

---

## Directory Structure

```
charvim/
├── nvim/
│   ├── init.lua                  # Entry point — loads all modules and bootstraps lazy.nvim
│   ├── lazy-lock.json            # Plugin version lockfile
│   ├── lua/
│   │   ├── alpha-config.lua      # Dashboard (start screen) config
│   │   ├── autoclose.lua         # Custom auto-close pairs module
│   │   ├── completion-config.lua # nvim-cmp completion setup
│   │   ├── harpoon-config.lua    # Harpoon 2 quick-file navigation
│   │   ├── keymaps.lua           # Global keybindings
│   │   ├── lsp-config.lua        # LSP server configs and diagnostics
│   │   ├── nvim-tmux-navigator.lua
│   │   ├── options.lua           # Editor options (tabs, clipboard, etc.)
│   │   ├── plugins.lua           # Plugin declarations for lazy.nvim
│   │   ├── statusline.lua        # Custom statusline
│   │   ├── treesitter-config.lua # Tree-sitter parser and highlight setup
│   │   └── img/
│   │       └── charVim.txt       # ASCII art logo for the dashboard
├── after/
│   └── ftplugin/
│       └── cobol.lua             # COBOL-specific overrides (tabstop 8, colorcolumn 7/73)
└── .nvim.bak/                    # Backup of a previous config version
```

---

## Leader Keys

| Key | Value |
|-----|-------|
| `<leader>` | `Space` |
| `<localleader>` | `\` |

Leader key timeout: **500ms**

---

## Keybindings

### General

| Keys | Mode | Action |
|------|------|--------|
| `jk` | Insert | Escape to normal mode |
| `<leader>w` | Normal | Save file (`:w`) |
| `<leader>q` | Normal | Save and quit (`:wq`) |
| `<leader>qq` | Normal | Quit without saving (`:q!`) |
| `;` | Normal | Shortcut to shell command (`:!`) |

### Navigation

| Keys | Mode | Action |
|------|------|--------|
| `[[` | Normal | Go to beginning of file (`gg`) |
| `]]` | Normal | Go to end of file (`G`) |
| `H` | Normal/Visual | Go to beginning of line (`0`) |
| `L` | Normal/Visual | Go to end of line (`$`) |
| `Alt+[` | Normal/Visual | Previous paragraph (`{`) |
| `Alt+]` | Normal/Visual | Next paragraph (`}`) |
| `Ctrl+h/j/k/l` | Normal | Navigate splits (also integrates with tmux panes) |

### Line Manipulation

| Keys | Mode | Action |
|------|------|--------|
| `Alt+k` / `Alt+j` | Normal | Move line up / down |
| `Alt+k` / `Alt+j` | Visual | Move selection up / down |
| `Ctrl+k` / `Ctrl+j` | Insert | Move line up / down |
| `Ctrl+Shift+k` / `Ctrl+Shift+j` | Normal | Copy (duplicate) line up / down |
| `Ctrl+Shift+k` / `Ctrl+Shift+j` | Visual | Copy selection up / down |

### File Explorer (Telescope File Browser)

| Keys | Mode | Action |
|------|------|--------|
| `<leader>e` | Normal | Open file browser at current file's directory |
| `<leader>v` | Normal | Open file browser (same as above) |
| `:E` or `:Tree` | Command | Open file browser |

### Telescope

| Keys | Context | Action |
|------|---------|--------|
| `Ctrl+.` | Telescope insert mode | Toggle hidden files |
| Dashboard `f` | Alpha | Find file |
| Dashboard `g` | Alpha | Live grep |
| Dashboard `r` | Alpha | Recent files |

Hidden files are shown by default. `.git/` directories are always ignored.

### Harpoon 2

| Keys | Mode | Action |
|------|------|--------|
| `<leader>a` | Normal | Add current file to Harpoon list |
| `<leader>ar` | Normal | Remove current file from Harpoon list |
| `<leader>ac` | Normal | Clear all Harpoon marks |
| `<leader>h` | Normal | Toggle Harpoon quick menu |
| `Alt+1` through `Alt+5` | Normal | Jump to Harpoon file 1–5 |
| `Alt+n` / `Alt+p` | Normal | Next / previous Harpoon file |

### LSP

| Keys | Mode | Action |
|------|------|--------|
| `K` | Normal | Hover documentation |
| `gd` | Normal | Go to definition |
| `gD` | Normal | Go to declaration |
| `gi` | Normal | Go to implementation |
| `go` | Normal | Go to type definition |
| `gr` | Normal | Show references |
| `gs` | Normal | Signature help |
| `<leader>lr` | Normal | Rename symbol |
| `<leader>ca` | Normal | Code action |
| `<leader>e` | Normal | Open diagnostic float (when LSP attached) |
| `[d` / `]d` | Normal | Previous / next diagnostic |
| `<leader>ih` | Normal | Toggle inlay hints |
| `<leader>ig` | Normal | Add word under cursor to dictionary |
| `<leader>di` | Normal | Inspect diagnostics at cursor |

### Java (buffer-local, active in `.java` files)

| Keys | Mode | Action |
|------|------|--------|
| `<leader>jb` | Normal | Build project (Maven/Gradle/Ant auto-detected) |
| `<leader>jt` | Normal | Run tests |
| `<leader>jc` | Normal | Clean project |
| `<leader>jw` | Normal | Clean JDTLS workspace cache |

### Completion (nvim-cmp)

| Keys | Mode | Action |
|------|------|--------|
| `Tab` / `Shift+Tab` | Insert | Cycle through completion items |
| `Ctrl+Space` | Insert | Trigger completion manually |
| `Enter` | Insert | Confirm selected completion |
| `Ctrl+e` | Insert | Abort completion |
| `Ctrl+b` / `Ctrl+f` | Insert | Scroll documentation up / down |

### Copilot

| Keys | Mode | Action |
|------|------|--------|
| `Alt+l` | Insert | Accept suggestion |
| `Alt+k` / `Alt+j` | Insert | Next / previous suggestion |
| `Ctrl+]` | Insert | Dismiss suggestion |
| `Alt+Enter` | Insert | Open Copilot panel |
| `[[` / `]]` | Copilot panel | Jump to previous / next suggestion |

### Tree-sitter Incremental Selection

| Keys | Mode | Action |
|------|------|--------|
| `gnn` | Normal | Init selection |
| `grn` | Normal | Expand to next node |
| `grc` | Normal | Expand to scope |
| `grm` | Normal | Shrink selection |

### Which-Key Groups

| Prefix | Group |
|--------|-------|
| `<leader>r` | Refactor |

### Other

| Keys | Mode | Action |
|------|------|--------|
| `<leader>d` | Normal | Go to Alpha dashboard |

---

## Plugins

### Plugin Manager
- **lazy.nvim** — Lazy-loading plugin manager. Change detection is enabled but silent.

### Theme
- **rose-pine** (variant: `main`) — Background is transparent (`disable_background = true`). Cursor line number highlighted in Rosé Pine gold.

### UI
- **noice.nvim** — Replaces the command line with a centered popup. Custom icons for search, filter, Lua, and help prompts. Messages are disabled (no nvim-notify dependency). Popupmenu uses `nui` backend.
- **alpha-nvim** — Dashboard/start screen with custom charVim ASCII art logo and quick-access buttons (find file, new file, recent files, live grep, config, Lazy, quit).
- **which-key.nvim** — Displays available keybindings in a popup (modern preset).

### Navigation & File Management
- **telescope.nvim** + **telescope-file-browser.nvim** — Fuzzy finder and file browser. Replaces netrw. Shows hidden files by default.
- **harpoon** (v2) — Quick file bookmarking and navigation. Saves on toggle, syncs on UI close.
- **vim-tmux-navigator** — Seamless navigation between Neovim splits and tmux panes with `Ctrl+h/j/k/l`.

### Editing
- **nvim-surround** — Add, change, and delete surrounding pairs (quotes, brackets, tags, etc.).
- **vim-visual-multi** — Multi-cursor support.
- **autoclose** (custom module) — Auto-closes brackets, quotes, and backticks. Handles escape-through-closing-char, backspace-deletes-pair, and enter-opens-block. Also works in command mode and visual mode (wrap selection).

### LSP & Diagnostics
- **nvim-lspconfig** — Base LSP client configurations.
- **mason.nvim** + **mason-lspconfig.nvim** — Automatic LSP server installation. Servers guaranteed installed: `lua_ls`, `pyright`, `ts_ls`, `jdtls`.
- **sourcekit-lsp** — Configured natively via `vim.lsp.config()` for Swift/C/C++/Objective-C.
- Diagnostics filter suppresses sentence/paragraph length warnings.
- Inlay hints enabled by default where supported (can toggle with `<leader>ih`).

#### Configured LSP Servers

| Server | Languages | Notes |
|--------|-----------|-------|
| `lua_ls` | Lua | Auto-installed via Mason |
| `pyright` | Python | Auto-installed via Mason |
| `ts_ls` | TypeScript/JavaScript | Auto-installed via Mason |
| `jdtls` | Java | Per-project workspace dirs, Maven/Gradle/Ant auto-detect, inlay hints forced on, code lens enabled |
| `gopls` | Go | Unused param + shadow analysis, gofumpt, full inlay hints |
| `tinymist` | Typst | Exports PDF on save |
| `sourcekit-lsp` | Swift, C, C++, Obj-C | Uses new `vim.lsp.config()` API |

### Completion
- **nvim-cmp** — Completion engine with sources:
  - `nvim_lsp` — LSP completions
  - `nvim_lua` — Neovim Lua API completions
  - `luasnip` — Snippet completions
  - `buffer` — Buffer word completions (fallback)
  - `path` — File path completions (fallback)
  - `copilot` — GitHub Copilot suggestions (via copilot-cmp)
- **LuaSnip** — Snippet engine.
- Completion also active in cmdline (`:` and `/` search).

### AI
- **copilot.lua** + **copilot-cmp** — GitHub Copilot integration. Auto-triggers suggestions with 75ms debounce. Disabled for yaml, markdown, help, and git files.

### Syntax & Parsing
- **nvim-treesitter** — Syntax highlighting, indentation, and incremental selection. Auto-installs missing parsers. Disables highlighting for files > 100KB.
- Installed parsers: c, crystal, lua, vim, vimdoc, query, javascript, typescript, python, rust, go, html, css, json, markdown, bash, yaml, toml.
- Crystal files (`.cr`) fall back to Ruby syntax if Tree-sitter highlighting fails.

### Document Authoring
- **typst-preview.nvim** — Live browser preview for Typst files. Custom commands: `:TP` (start), `:TS` (stop), `:TU` (update).

---

## Editor Options

| Option | Value |
|--------|-------|
| Line numbers | On (absolute) |
| Relative numbers | Off |
| Tab width | 4 spaces (expandtab) |
| Smart indent | On |
| Swap files | Off |
| Backup files | Off |
| Clipboard | System clipboard (`unnamedplus`) |
| Scroll offset | 10 lines |
| Encoding | UTF-8 |
| Cursor line | Highlighted (number only, gold color) |
| Cursor shape | Block in normal/visual, vertical bar in insert, horizontal bar in replace |
| Command line height | 0 (hidden) |
| Whitespace chars | Visible (tab `▸`, trail `·`, extends `»`, precedes `«`, nbsp `␣`, leading `│`) |
| Background | Transparent (both Normal and NormalFloat) |

---

## Statusline

Custom-built statusline (no plugin). Displays:
- **Left:** Gold `V` indicator + filename + modified flag `[+]`
- **Right:** Save confirmation (purple flash for 2s) + current mode name + percentage + column + "Help"

Mode names: NORMAL, INSERT, VISUAL, V-LINE, V-BLOCK, COMMAND, SELECT, REPLACE, SHELL, TERMINAL.

Highlight colors use Rosé Pine palette:
- Mode box: gold `#f6c177` on dark `#191724`
- Saved flash: iris `#c4a7e7` on dark `#191724`
- Bar: foam `#e0def4` on dark `#191724`

---

## Filetype-Specific Settings

### COBOL (`after/ftplugin/cobol.lua`)
- Tab width: 8 spaces
- Color columns at 7 and 73 (traditional fixed-format margins)
- Text width: 72
- Absolute line numbers, no relative numbers

### Crystal
- `.cr` files mapped to `crystal` filetype
- Custom Tree-sitter parser from `crystal-lang-tools/tree-sitter-crystal`
- Falls back to Ruby syntax highlighting if Tree-sitter fails

### Java
- Build system auto-detected (Maven `pom.xml`, Gradle `build.gradle`, Ant `build.xml`)
- Per-project JDTLS workspace directories stored in `~/.cache/nvim/jdtls/<project_name>`
- Import organization, code lens, and code generation templates configured

---

## Custom Commands

| Command | Action |
|---------|--------|
| `:E` | Open Telescope file browser |
| `:Tree` | Open Telescope file browser |
| `:TP` | Start Typst preview |
| `:TS` | Stop Typst preview |
| `:TU` | Update Typst preview |

---

## Notes

- The `.nvim.bak/` directory contains a backup of a previous configuration version.
- Plugin versions are locked in `nvim/lazy-lock.json`. Run `:Lazy update` to update and `:Lazy restore` to roll back.
- Mason-managed LSP servers are stored in Neovim's data directory (`~/.local/share/nvim/mason/`).
- The autoclose module is a custom implementation (not a plugin), located at `nvim/lua/autoclose.lua`.
