-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

---@module 'lazy'
---@type LazySpec
return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree toggle action=show<CR>', desc = 'NeoTree reveal', silent = true },
  },
  ---@module 'neo-tree'
  ---@type neotree.Config
  opts = {
    close_if_last_window = true,
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },

      filtered_items = {
        visible = true,
        hide_gitignored = true,
        hide_dotfiles = false,
      },

      follow_current_file = {
        enabled = true,
      },
    },
  },
  init = function()
    vim.api.nvim_create_autocmd('VimEnter', {
      group = vim.api.nvim_create_augroup('vim-enter-open-neo-tree', { clear = true }),
      callback = function()
        ---@diagnostic disable-next-line: param-type-mismatch
        if vim.fn.argv(0) == '.' or vim.fn.argv(0) == '' or vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
          vim.cmd 'Neotree reveal action=show'
        end
      end,
    })
  end,
}
