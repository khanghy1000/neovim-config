-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

---@module 'lazy'
---@type LazySpec
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
    -- NOTE: Does not work well with multicursor.nvim plugin
    'jinh0/eyeliner.nvim',
    opts = {
      highlight_on_key = true,
      dim = true,
    },
  },
  -- {
  --   'kylechui/nvim-surround',
  --   event = 'VeryLazy',
  --   opts = {},
  -- },
  {
    'OXY2DEV/markview.nvim',
    lazy = false,
    dependencies = { 'saghen/blink.cmp' },
  },
}
