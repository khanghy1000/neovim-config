return {
  'sindrets/diffview.nvim',
  keys = {
    { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = '[G]it [D]iffview Open' },
    { '<leader>gh', '<cmd>DiffviewFileHistory<cr>', desc = '[G]it File [H]istory' },
  },
  config = function()
    vim.api.nvim_create_autocmd('TabEnter', {
      group = vim.api.nvim_create_augroup('diffview-tab-close', { clear = true }),
      callback = function()
        for _, tab_id in ipairs(vim.api.nvim_list_tabpages()) do
          if tab_id == vim.api.nvim_get_current_tabpage() then
            goto continue
          end

          for _, win_id in ipairs(vim.api.nvim_tabpage_list_wins(tab_id)) do
            local buf_id = vim.api.nvim_win_get_buf(win_id)
            if vim.bo[buf_id].filetype == 'DiffviewFiles' or vim.bo[buf_id].filetype == 'DiffviewFileHistory' then
              vim.cmd('tabclose ' .. vim.api.nvim_tabpage_get_number(tab_id))
              break
            end
          end

          ::continue::
        end
      end,
    })

    require('diffview').setup {
      view = {
        merge_tool = {
          layout = 'diff3_mixed',
        },
      },
    }
  end,
}
