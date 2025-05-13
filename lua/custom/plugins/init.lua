return {
  'justinmk/vim-gtfo',
  'HiPhish/rainbow-delimiters.nvim',
  { 'kevinhwang91/nvim-bqf', ft = 'qf' },
  'tpope/vim-fugitive',
  'MagicDuck/grug-far.nvim',
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      vim.cmd [[hi TreesitterContextBottom gui=underline guisp=Grey]]
      vim.cmd [[hi TreesitterContextLineNumberBottom gui=underline guisp=Grey]]

      vim.keymap.set('n', '[p', function()
        require('treesitter-context').go_to_context(vim.v.count1)
      end, { silent = true, desc = 'Jump to [P]arent context' })

      require('treesitter-context').setup {
        multiline_threshold = 1,
      }
    end,
  },
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
  {
    'stevearc/overseer.nvim',
    keys = {
      { '<leader>or', '<cmd>OverseerRun<cr>', desc = '[O]verseer [R]un' },
      { '<leader>ot', '<cmd>OverseerToggle<cr>', desc = '[O]verseer [T]oggle' },
    },
    opts = {},
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  {
    'ThePrimeagen/refactoring.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    lazy = false,
    opts = {},
  },
  {
    'kawre/leetcode.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      -- "ibhagwan/fzf-lua",
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
    },
    opts = {},
  },
}
