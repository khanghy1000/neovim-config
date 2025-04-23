return {
  'sindrets/diffview.nvim',
  keys = {
    { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = '[G]it [D]iffview Open' },
    { '<leader>gh', '<cmd>DiffviewFileHistory<cr>', desc = '[G]it File [H]istory' },
  },
  config = function()
    require('diffview').setup {
      view = {
        merge_tool = {
          layout = 'diff3_mixed',
        },
      },
    }
  end,
}
