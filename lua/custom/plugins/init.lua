return {
  'justinmk/vim-gtfo',
  'HiPhish/rainbow-delimiters.nvim',
  {
    'NvChad/nvim-colorizer.lua',
    opts = {},
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        component_separators = { left = '|', right = '|' },
        section_separators = '',
      },
    },
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
  },
}
