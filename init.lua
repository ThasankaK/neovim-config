-- Small personal Neovim config. Space is the shortcut prefix (leader).
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.signcolumn = 'yes'
vim.opt.scrolloff = 8
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.undofile = true
vim.opt.splitright = true
vim.opt.splitbelow = true
-- OSC 52 lets supported terminals (including Windows Terminal) copy to Windows.
-- Explicit + register access: select text, then "+y. Normal y stays local.
if vim.env.WSL_DISTRO_NAME then
  vim.g.clipboard = 'osc52'
end

local map = vim.keymap.set
map('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlighting' })
map('n', '<leader>w', '<cmd>write<CR>', { desc = 'Save file' })
map('n', '<leader>e', '<cmd>Explore<CR>', { desc = 'Browse files' })
map('n', '<leader>q', '<cmd>quit<CR>', { desc = 'Close window' })
map('n', '<C-h>', '<C-w>h', { desc = 'Focus left window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Focus window below' })
map('n', '<C-k>', '<C-w>k', { desc = 'Focus window above' })
map('n', '<C-l>', '<C-w>l', { desc = 'Focus right window' })
