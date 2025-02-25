return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if prefer nvim-web-devicons
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    default_file_explorer = false,
    use_default_keymaps = false,
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      ['g?'] = 'actions.show_help',
      ['q'] = 'actions.parent',
      ['`'] = 'actions.open_cwd',
      ['<CR>'] = 'actions.select',
      ['<C-v>'] = { 'actions.select', opts = { vertical = true }, desc = 'Open the entry in a vertical split' },
      ['<C-x>'] = { 'actions.select', opts = { horizontal = true }, desc = 'Open the entry in a horizontal split' },
      -- ['<C-c>'] = 'actions.close',
      ['gx'] = 'actions.open_external',
      ['g\\'] = 'actions.toggle_trash',
    },
  },

  config = function(_, opts)
    require('oil').setup(opts)
    vim.keymap.set('n', '<leader>o', require('oil').open, { desc = 'Open [O]il' })
  end,
}
