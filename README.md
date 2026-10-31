# Neovim config

My personal Neovim setup for Ubuntu on WSL2: Catppuccin Mocha, Lualine status bar, which-key shortcut hints, nvim-tree file sidebar, Telescope search, and Python completion and diagnostics via Pyright. lazy.nvim installs plugins; lazy-lock.json records their versions.

## Requirements

- Neovim 0.11.3 or newer
- Git, ripgrep, curl, unzip
- Node.js 22+ and npm (for Pyright)
- Internet access for the initial plugin and language server installation

On Ubuntu, install Neovim with `sudo apt update && sudo apt install neovim git ripgrep nodejs npm curl unzip`. Check `nvim --version`; older Ubuntu releases may provide a version below 0.11.

## Set up on Linux or WSL

If `~/.config/nvim` already exists, back it up or move it aside before cloning.

```bash
mkdir -p ~/.config
git clone https://github.com/ThasankaK/neovim-config.git ~/.config/nvim
nvim
```

If you use a custom XDG_CONFIG_HOME, clone into `$XDG_CONFIG_HOME/nvim` instead.

Wait for installation to finish on first launch, then restart Neovim. Use `:Lazy` to check plugins, `:Mason` to check Pyright, and `:checkhealth` to investigate missing tools. Run `:Tutor` for the interactive introduction.

## Set up on native Windows

Install the same requirements for Windows, then run in PowerShell. Back up an existing config first.

```powershell
git clone https://github.com/ThasankaK/neovim-config.git "$env:LOCALAPPDATA/nvim"
nvim
```

WSL and native Windows use separate config directories. For WSL, follow the Linux instructions inside your Linux terminal.

## Controls

Space is the leader key: press Space, then the following key.

| Keys | Action |
| --- | --- |
| `i` | Enter insert mode to type |
| `Esc` | Leave insert mode; in normal mode, clear search highlighting |
| `Space w` | Save |
| `Space e` | Toggle file sidebar |
| `Space q` | Close the current window (unsaved changes require saving first) |
| `Ctrl h/j/k/l` | Focus the left/down/up/right window |
| `/text` then Enter | Search |
| `u` / `Ctrl r` | Undo / redo |
| `:q` then Enter | Quit |

Line numbers, mouse support, persistent undo, case-smart searching, and four-space indentation are enabled. In WSL, explicit clipboard copying (`"+y`) uses OSC 52 and requires a compatible terminal. Windows Terminal paste is usually Ctrl+Shift+V.

## Keep machines in sync

Edit `init.lua` in the cloned configuration directory, then commit and push:

```bash
cd ~/.config/nvim
git add init.lua lua/plugins.lua lazy-lock.json README.md .gitignore
git commit -m "Update Neovim config"
git push
```

On another machine, run `git -C ~/.config/nvim pull --ff-only`, then `:Lazy restore` inside Neovim to install the recorded plugin versions. Commit or move aside local changes before pulling. Native Windows users should use their Windows config directory instead.

Only configuration belongs in this repo. Plugin downloads, undo history, and other editor data stay in Neovim's separate data directories. Keep credentials and work-specific settings out of this repository.

## New controls

Pause after Space to see shortcut hints. All shortcuts below are used in normal mode.

| Keys | Action |
| --- | --- |
| `Space ff` | Find files |
| `Space fg` | Search project text |
| `Space fb` | Switch open buffers |
| `Space fh` | Search help |
| `gd` | Go to definition |
| `grr` | Find references |
| `K` | Show documentation |
| `Space rn` | Rename symbol |
| `Space ca` | Code action |
| `Space d` | Diagnostic details |
| `[d` / `]d` | Previous/next diagnostic |
| `:wq` / `:q!` | Save and quit / quit discarding changes |

Language features require an attached server. While typing, Ctrl+n / Ctrl+p select completion suggestions, Enter accepts a selected suggestion, Ctrl+Space opens suggestions, and Ctrl+e closes them. Enter without a selection inserts a newline. Press Enter in the sidebar to open a file.

Run Neovim from the directory you want to search (`cd your-project`, then `nvim`). Search respects ignore files. For Python dependencies, activate your project's virtual environment before launching Neovim.

## Appearance and local setup

The theme is Catppuccin Mocha; change its flavour in `lua/plugins.lua`. Fonts and font size are configured in Windows Terminal's Ubuntu profile under Appearance. The status bar and file sidebar do not require a Nerd Font.

On my personal WSL machine, `~/.config/nvim` links to `/mnt/c/Users/Thasanka/dev/neovim-config`, so edits through either path change the same files. Other machines can clone directly to their config directory as above. Native Windows is documented but not tested.

Formatting, debugging, and additional language servers can be added as needed.
