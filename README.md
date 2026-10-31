# Neovim config

My personal Neovim configuration, starting small and growing with the projects I work on. Primarily used in Ubuntu on WSL2.

## Requirements

- Neovim 0.11 or newer
- Git
- No plugins or plugin manager required

On Ubuntu, install Neovim with `sudo apt update && sudo apt install neovim`. Check `nvim --version`; older Ubuntu releases may provide a version below 0.11.

## Set up on Linux or WSL

Replace YOUR_USERNAME with your GitHub username. If `~/.config/nvim` already exists, back it up or move it aside before cloning.

```bash
mkdir -p ~/.config
git clone https://github.com/YOUR_USERNAME/nvim-config.git ~/.config/nvim
nvim
```

If you use a custom XDG_CONFIG_HOME, clone into `$XDG_CONFIG_HOME/nvim` instead.

Run `:Tutor` inside Neovim for the interactive introduction.

## Set up on native Windows

Install Neovim 0.11+ and Git, then run in PowerShell. Back up an existing config first.

```powershell
git clone https://github.com/YOUR_USERNAME/nvim-config.git "$env:LOCALAPPDATA/nvim"
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
| `Space e` | Browse files |
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
git add init.lua README.md
git commit -m "Update Neovim config"
git push
```

On another machine, run `git -C ~/.config/nvim pull --ff-only`. Commit or move aside local changes before pulling. Native Windows users should use their Windows config directory instead.

Only configuration belongs in this repo. Plugin downloads, undo history, and other editor data stay in Neovim's separate data directories. Keep credentials and work-specific settings out of this repository.
