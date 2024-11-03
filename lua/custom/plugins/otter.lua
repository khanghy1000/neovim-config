return {
  'jmbuhr/otter.nvim',
  cmd = {
    'OtterActivate',
  },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    local otter = require 'otter'
    otter.setup {}
    vim.api.nvim_create_user_command('OtterActivate', function()
      otter.activate()
    end, {})
  end,
}
