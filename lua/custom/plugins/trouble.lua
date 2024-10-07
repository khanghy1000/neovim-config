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
      '<leader>dd',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = '[D]iagnostics (Trouble)',
    },
    {
      '<leader>db',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = '[B]uffer Diagnostics (Trouble)',
    },
    {
      '<leader>ds',
      '<cmd>Trouble symbols toggle<cr>',
      desc = '[S]ymbols (Trouble)',
    },
    {
      '<leader>da',
      '<cmd>Trouble lsp_document_symbols toggle<cr>',
      desc = '[A]ll symbols (Trouble)',
    },
    {
      '<leader>dl',
      '<cmd>Trouble lsp toggle<cr>',
      desc = '[L]SP Definitions / references / ... (Trouble)',
    },
    {
      '<leader>df',
      '<cmd>Trouble qflist toggle<cr>',
      desc = 'Quick[F]ix List (Trouble)',
    },
  },
}
