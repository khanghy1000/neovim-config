return {
  'justinmk/vim-gtfo',
  'HiPhish/rainbow-delimiters.nvim',
  { 'kevinhwang91/nvim-bqf', ft = 'qf' },
  'tpope/vim-fugitive',
  {
    'unblevable/quick-scope',
    init = function()
      vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
    end,
  },
  {
    'NvChad/nvim-colorizer.lua',
    opts = {},
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    opts = {
      enable_autocmd = false,
    },
  },
  {
    'jiaoshijie/undotree',
    dependencies = 'nvim-lua/plenary.nvim',
    config = true,
    keys = { -- load the plugin only when using it's keybinding:
      { '<leader>u', "<cmd>lua require('undotree').toggle()<cr>", desc = '[U]ndotree' },
    },
    opts = {
      position = 'right',
    },
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = { open_mapping = [[<C-t>]], direction = 'float' },
  },
}
