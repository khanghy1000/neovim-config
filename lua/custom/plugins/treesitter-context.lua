return {
  'nvim-treesitter/nvim-treesitter-context',
  config = function()
    vim.api.nvim_set_hl(0, 'TreesitterContextBottom', { sp = '#89ACF3', underline = true })
    vim.api.nvim_set_hl(0, 'TreesitterContextLineNumberBottom', { sp = '#89ACF3', underline = true })

    vim.keymap.set('n', '[s', function()
      require('treesitter-context').go_to_context(vim.v.count1)
    end, { silent = true, desc = 'Jump to [S]ticky scroll context' })

    require('treesitter-context').setup {
      multiline_threshold = 1,
    }
  end,
}
