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

-- Install the plugin manager on a new machine.
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  local output = vim.fn.system({
    'git', 'clone', '--filter=blob:none', '--branch=stable',
    'https://github.com/folke/lazy.nvim.git', lazypath,
  })
  if vim.v.shell_error ~= 0 then
    error('Could not install lazy.nvim. Check your network and restart Neovim.\n' .. output)
  end
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup('plugins', {
  change_detection = { notify = false },
  performance = {
    rtp = { reset = false },
  },
})

