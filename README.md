# my-nvim

Personal Neovim config, managed with [lazy.nvim](https://github.com/folke/lazy.nvim).

**Leader key:** `<Space>`

## Layout

```
init.lua                 lazy bootstrap, global keymaps, @l macro
lua/vim-options.lua      indent settings, leader key
lua/plugins/*.lua        one spec per plugin (auto-imported by lazy)
lazy-lock.json           pinned plugin commits
```

`require("lazy").setup("plugins")` imports every file in `lua/plugins/`, so adding
a plugin is just dropping a new `lua/plugins/<name>.lua` that returns a spec table.

## Keymaps

### Navigation & search

| Key | Action |
| --- | --- |
| `<C-p>` | Find files (Telescope) |
| `<leader>fg` | Live grep across project (Telescope) |
| `<leader>n` | File tree, left sidebar (Neo-tree) |
| `<leader>bf` | Open buffers, floating window (Neo-tree) |

### Scrolling

All recenter the cursor after moving.

| Key | Action |
| --- | --- |
| `<C-f>` / `<C-b>` | Page down / up |
| `<C-d>` / `<C-u>` | Half-page down / up |

### LSP

| Key | Action |
| --- | --- |
| `K` | Hover docs |
| `<leader>ca` | Code action |
| `<leader>f` | Format buffer (none-ls: stylua, prettier) |

### Editing

| Key | Mode | Action |
| --- | --- | --- |
| `LB` | normal | Blank line below, cursor stays put |
| `LU` | normal | Blank line above, cursor stays put |
| `cpc` | visual | Yank to system clipboard |
| `cpp` | visual | Paste from system clipboard |
| `@l` | normal | On a word → insert `console.log('word:', word)` below |

### Completion (insert mode, nvim-cmp)

| Key | Action |
| --- | --- |
| `<C-Space>` | Trigger completion |
| `<CR>` | Confirm selection |
| `<C-e>` | Dismiss |
| `<C-b>` / `<C-f>` | Scroll docs popup |

### Terminal

| Key | Action |
| --- | --- |
| `<leader>t` | Toggle terminal (ToggleTerm) |

### Discovering keymaps

which-key pops up automatically: start any prefix (`<Space>`, `g`, `z`, `<C-w>`)
and pause, and it lists what can follow.

| Key | Action |
| --- | --- |
| `<leader>?` | Show all keymaps for the current buffer |

## Ex commands

| Command | Action |
| --- | --- |
| `:Lazy` | Plugin manager UI |
| `:Mason` | LSP / tool installer UI |
| `:VimBeGood` | Motion practice game |

Alpha shows a startify dashboard on launch when no file argument is given.

## Plugins

| Plugin | Purpose |
| --- | --- |
| lazy.nvim | Plugin manager |
| mason.nvim + mason-lspconfig | LSP server installation |
| nvim-lspconfig | LSP client config (`ts_ls`, `html`, `lua_ls`) |
| nvim-cmp + LuaSnip | Completion and snippets |
| telescope.nvim | Fuzzy finder (+ `ui-select` extension) |
| neo-tree.nvim | File explorer |
| nvim-treesitter | Syntax highlighting and indent |
| none-ls.nvim | Formatting via stylua / prettier |
| lualine.nvim | Statusline (dracula theme) |
| alpha-nvim | Startup dashboard |
| toggleterm.nvim | Terminal toggle |
| catppuccin | Active colorscheme (`catppuccin-mocha`) |
| rose-pine | Installed but inert; alternate colorscheme |
| which-key.nvim | Keymap discovery popup |
| vim-be-good | Motion practice |

## Notes

### Changing the colorscheme

The active colorscheme is set in `lua/plugins/catppuccin.lua`. rose-pine is
installed as a `lazy = true` spec, so switching means changing the
`vim.cmd.colorscheme(...)` call there.

### LSP servers install automatically

`lua/plugins/lsp-config.lua` sets `ensure_installed = { "ts_ls", "html", "lua_ls" }`,
so Mason installs them on startup if missing. Note the option is
`automatic_installation` — `auto_install` is not a real setting and is
silently ignored, which leaves servers uninstalled and produces
"language server ... is either not installed, missing from PATH" errors.

Mason package names differ from lspconfig server names (`html` → `html-lsp`).
Use `:Mason` to browse the correct names.

### nvim-lspconfig is version-pinned

`lua/plugins/lsp-config.lua` pins `version = "v1.8.0"`. nvim-lspconfig 2.x
requires **Nvim 0.11.3+**, and this setup runs Nvim 0.10 — an unpinned update
would break LSP entirely. v1.8.0 is the newest release that has the
`tsserver` → `ts_ls` rename while still supporting Nvim 0.9+.

After upgrading Neovim past 0.11.3, drop the `version` line to move to 2.x.
Note that 2.x also shifts toward the native `vim.lsp.config` API, so that is
more than a version bump.
