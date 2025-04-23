return {
  'folke/trouble.nvim',
  cmd = 'Trouble',
  opts = {
    focus = true,
    modes = {
      symbols = { -- Configure symbols mode
        focus = true,
        win = {
          type = 'split', -- split window
          relative = 'win', -- relative to current window
          position = 'right', -- right side
          size = 0.3, -- 30% of the window
        },
      },
      lsp_document_symbols = {
        focus = true,
        win = {
          type = 'split', -- split window
          relative = 'win', -- relative to current window
          position = 'right', -- right side
          size = 0.3, -- 30% of the window
        },
      },
      lsp = {
        focus = true,
        win = {
          type = 'split', -- split window
          relative = 'win', -- relative to current window
          position = 'right', -- right side
          size = 0.3, -- 30% of the window
        },
      },
    },
  },
  keys = {
    {
      '<leader>dw',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = '[W]orkspace Diagnostics',
    },
    {
      '<leader>db',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = '[B]uffer Diagnostics',
    },
    {
      '<leader>dl',
      '<cmd>Trouble lsp toggle<cr>',
      desc = '[L]SP Definitions / references / ...',
    },
    {
      '<leader>dq',
      '<cmd>Trouble qflist toggle<cr>',
      desc = '[Q]uickfix List',
    },
    {
      '<leader>do',
      '<cmd>Trouble loclist toggle<cr>',
      desc = '[L]ocation List',
    },
  },
  specs = {
    'folke/snacks.nvim',
    opts = function(_, opts)
      return vim.tbl_deep_extend('force', opts or {}, {
        picker = {
          actions = require('trouble.sources.snacks').actions,
          win = {
            input = {
              keys = {
                ['<c-t>'] = {
                  'trouble_open',
                  mode = { 'n', 'i' },
                },
              },
            },
          },
        },
      })
    end,
  },
}
