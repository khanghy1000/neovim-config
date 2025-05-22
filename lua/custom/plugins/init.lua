return {
  'justinmk/vim-gtfo',
  'HiPhish/rainbow-delimiters.nvim',
  { 'kevinhwang91/nvim-bqf', ft = 'qf' },
  'tpope/vim-fugitive',
  'MagicDuck/grug-far.nvim',
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
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = { open_mapping = [[<C-t>]], direction = 'float' },
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  {
    'jinh0/eyeliner.nvim',
    opts = {
      highlight_on_key = true,
      dim = true,
    },
  },
  {
    'kylechui/nvim-surround',
    event = 'VeryLazy',
    opts = {},
  },
}
