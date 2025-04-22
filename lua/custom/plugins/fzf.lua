return {
  {
    'ibhagwan/fzf-lua',
    event = 'VimEnter',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      local fzf = require 'fzf-lua'

      fzf.setup {
        winopts = {
          border = 'single',
        },

        defaults = {
          hidden = true,
          no_ignore = true,
          fd_opts = table.concat({
            '--type f',
            '--hidden',
            '--exclude node_modules',
            '--exclude target',
            '--exclude dist',
            '--exclude build',
            '--exclude out',
            '--exclude .git',
            '--exclude .venv',
            '--exclude .svelte-kit',
            '--exclude bin',
            '--exclude obj',
            '--exclude .idea',
            '--exclude __virtual.cs$',
          }, ' '),
        },

        files = {
          cwd_prompt = false,
        },

        oldfiles = {
          include_current_session = true,
        },
      }

      -- Use fzf-lua for vim.ui.select()
      pcall(fzf.register_ui_select)

      local map = vim.keymap.set
      map('n', '<leader>sh', fzf.help_tags, { desc = '[S]earch [H]elp' })
      map('n', '<leader>sk', fzf.keymaps, { desc = '[S]earch [K]eymaps' })
      map('n', '<leader>sf', fzf.files, { desc = '[S]earch [F]iles' })
      map('n', '<leader>ss', fzf.builtin, { desc = '[S]earch [S]elect FzfLua' })
      map('n', '<leader>sw', fzf.grep_cword, { desc = '[S]earch current [W]ord' })
      map('n', '<leader>sg', fzf.grep_project, { desc = '[S]earch by [G]rep' })
      map('n', '<leader>sd', fzf.diagnostics_document, { desc = '[S]earch [D]iagnostics' })
      map('n', '<leader>sr', fzf.resume, { desc = '[S]earch [R]esume' })
      map('n', '<leader>s.', fzf.oldfiles, { desc = "[S]earch Recent Files (repeat '.')" })
      map('n', '<leader><leader>', fzf.buffers, { desc = '[ ] Find existing buffers' })
      map('n', '<leader>sc', fzf.grep_curbuf, { desc = 'Fuzzily [S]earch in Current Buffer' })
      map('n', '<leader>sn', function()
        fzf.files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },
}
