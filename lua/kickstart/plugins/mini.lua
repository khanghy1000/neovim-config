return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      -- require('mini.surround').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      -- local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      -- statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      -- statusline.section_location = function()
      --   return '%2l:%-2v'
      -- end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim

      -- MiniFiles
      -- require('mini.files').setup {
      --   mappings = {
      --     synchronize = 'w',
      --   },
      --
      --   options = {
      --     use_as_default_explorer = false,
      --   },
      -- }

      -- local show_dotfiles = true
      -- vim.keymap.set('n', '<leader>e', require('mini.files').open, { desc = '[E] Open MiniFiles' })

      -- MiniComment
      require('mini.comment').setup {
        options = {
          custom_commentstring = function()
            return require('ts_context_commentstring').calculate_commentstring() or vim.bo.commentstring
          end,
        },
        mappings = {
          comment_line = '<leader>/',
          comment_visual = '<leader>/',
        },
      }

      -- MiniBufremove
      require('mini.bufremove').setup()
      vim.keymap.set('n', '<leader>q', function()
        if require('custom.utils').curr_tab_has_ft 'DiffviewFiles' or require('custom.utils').curr_tab_has_ft 'DiffviewFileHistory' then
          vim.cmd 'DiffviewClose'
        else
          require('mini.bufremove').delete()
        end
      end, { desc = '[Q] Delete current buffer' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
