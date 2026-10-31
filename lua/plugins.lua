return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup({ flavour = 'mocha' })
      vim.cmd.colorscheme('catppuccin')
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'catppuccin' },
    opts = {
      options = {
        theme = 'catppuccin',
        icons_enabled = false,
        component_separators = '|',
        section_separators = '',
      },
    },
  },
  {
    'folke/which-key.nvim',
    opts = { icons = { mappings = false } },
  },
  {
    'nvim-tree/nvim-tree.lua',
    opts = {
      view = { width = 32 },
      renderer = { icons = { show = { file = false, folder = false, git = false, modified = false, diagnostics = false, bookmarks = false } } },
    },
    keys = {
      { '<leader>e', '<cmd>NvimTreeToggle<CR>', desc = 'Toggle file sidebar' },
    },
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
    keys = {
      { '<leader>ff', '<cmd>Telescope find_files<CR>', desc = 'Find files' },
      { '<leader>fg', '<cmd>Telescope live_grep<CR>', desc = 'Search project text' },
      { '<leader>fb', '<cmd>Telescope buffers<CR>', desc = 'Find open buffers' },
      { '<leader>fh', '<cmd>Telescope help_tags<CR>', desc = 'Search help' },
    },
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path' },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        snippet = { expand = function(args) vim.snippet.expand(args.body) end },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
        }),
        sources = cmp.config.sources({ { name = 'nvim_lsp' } }, {
          { name = 'path' }, { name = 'buffer' },
        }),
      })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      vim.lsp.config('pyright', {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      })
      require('mason-lspconfig').setup({ ensure_installed = { 'pyright' } })
      vim.diagnostic.config({ virtual_text = true, float = { border = 'rounded' } })
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(event)
          local map = function(keys, action, desc)
            vim.keymap.set('n', keys, action, { buffer = event.buf, desc = desc })
          end
          map('gd', vim.lsp.buf.definition, 'Go to definition')
          map('grr', vim.lsp.buf.references, 'Find references')
          map('K', vim.lsp.buf.hover, 'Show documentation')
          map('<leader>rn', vim.lsp.buf.rename, 'Rename symbol')
          map('<leader>ca', vim.lsp.buf.code_action, 'Code action')
          map('<leader>d', vim.diagnostic.open_float, 'Show diagnostic')
        end,
      })
    end,
  },
}
