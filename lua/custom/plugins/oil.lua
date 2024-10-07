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
      ['-'] = 'actions.select',
      ['<CR>'] = 'actions.select',
      ['<C-c>'] = 'actions.close',
      ['`'] = 'actions.parent',
      ['~'] = 'actions.open_cwd',
      ['gx'] = 'actions.open_external',
      ['g\\'] = 'actions.toggle_trash',
    },
  },

  config = function(_, opts)
    require('oil').setup(opts)
    vim.keymap.set('n', '<leader>o', require('oil').open, { desc = 'Toggle [O]il' })
  end,
}
