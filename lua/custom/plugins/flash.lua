return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  opts = {
    modes = {
      char = {
        enabled = false,
        multi_line = false,
      },
    },
  },
  keys = {
    {
      'gs',
      mode = { 'n', 'x', 'o' },
      function() require('flash').jump() end,
      desc = 'Flash Jump',
    },
    {
      'gS',
      mode = { 'n', 'x', 'o' },
      function() require('flash').treesitter() end,
      desc = 'Flash Treesitter',
    },
  },
}
