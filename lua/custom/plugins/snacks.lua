---@diagnostic disable: undefined-global
return {
  'folke/snacks.nvim',
  opts = {
    picker = {
      hidden = true,
      ignored = true,
      sources = {
        files = {
          hidden = true,
          ignored = true,
          exclude = {
            '**/node_modules/**',
            '**/target/**',
            '**/dist/**',
            '**/build/**',
            '**/out/**',
            '**/.git/**',
            '**/.venv/**',
            '**/.svelte-kit/**',
            '**/bin/**',
            '**/obj/**',
            '**/.idea/**',
            '**/*__virtual.cs',
          },
        },
      },
    },
    lazygit = {},
  },
  keys = {
    {
      '<leader>sh',
      function()
        Snacks.picker.help()
      end,
      desc = '[S]earch [H]elp',
    },
    {
      '<leader>sk',
      function()
        Snacks.picker.keymaps()
      end,
      desc = '[S]earch [K]eymaps',
    },
    {
      '<leader>sf',
      function()
        Snacks.picker.files()
      end,
      desc = '[S]earch [F]iles',
    },
    {
      '<leader>ss',
      function()
        Snacks.picker()
      end,
      desc = '[S]earch [S]elect Picker',
    },
    {
      '<leader>sw',
      function()
        Snacks.picker.grep_word()
      end,
      desc = '[S]earch current [W]ord',
    },
    {
      '<leader>sg',
      function()
        Snacks.picker.grep()
      end,
      desc = '[S]earch by [G]rep',
    },
    {
      '<leader>sd',
      function()
        Snacks.picker.diagnostics()
      end,
      desc = '[S]earch [D]iagnostics',
    },
    {
      '<leader>sr',
      function()
        Snacks.picker.resume()
      end,
      desc = '[S]earch [R]esume',
    },
    {
      '<leader>s.',
      function()
        Snacks.picker.recent()
      end,
      desc = '[S]earch Recent Files',
    },
    {
      '<leader><leader>',
      function()
        Snacks.picker.buffers()
      end,
      desc = '[ ] Find existing buffers',
    },
    {
      '<leader>sb',
      function()
        Snacks.picker.lines()
      end,
      desc = 'Fuzzily [S]earch in current [B]uffer',
    },
    {
      '<leader>sB',
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = '[S] Grep Open [B]uffers',
    },
    {
      '<leader>sn',
      function()
        Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = '[S]earch [N]eovim files',
    },

    {
      '<leader>gg',
      function()
        Snacks.lazygit()
      end,
      desc = 'LazyGit',
    },
  },
}
