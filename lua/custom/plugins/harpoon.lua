return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    harpoon:setup()

    harpoon:extend {
      UI_CREATE = function(cx)
        vim.keymap.set('n', '<C-v>', function()
          harpoon.ui:select_menu_item { vsplit = true }
        end, { buffer = cx.bufnr })

        vim.keymap.set('n', '<C-x>', function()
          harpoon.ui:select_menu_item { split = true }
        end, { buffer = cx.bufnr })

        for line_number, file in pairs(cx.contents) do
          if string.find(cx.current_file, file, 1, true) then
            -- highlight the harpoon menu line that corresponds to the current buffer
            vim.hl.range(cx.bufnr, 1, 'Function', { line_number - 1, 0 }, { line_number - 1, -1 })
            -- set the position of the cursor in the harpoon menu to the start of the current buffer line
            vim.api.nvim_win_set_cursor(cx.win_id, { line_number, 0 })
          end
        end
      end,
    }

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
      local buf_name = vim.api.nvim_buf_get_name(0)
      local rel_buf_name = vim.fn.fnamemodify(buf_name, ':.')
      vim.print('"' .. rel_buf_name .. '"' .. ' added to Harpoon')
    end, { desc = '[A]dd file to Harpoon' })

    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Toggle Harpoon window' })

    vim.keymap.set('n', '<M-n>', function()
      harpoon:list():next()
    end, { desc = 'Navigate to next mark' })

    vim.keymap.set('n', '<M-p>', function()
      harpoon:list():prev()
    end, { desc = 'Navigate to previous mark' })

    vim.keymap.set('n', '<leader>1', function()
      harpoon:list():select(1)
    end, { desc = 'Navigate to mark [1]' })
    vim.keymap.set('n', '<leader>2', function()
      harpoon:list():select(2)
    end, { desc = 'Navigate to mark [2]' })
    vim.keymap.set('n', '<leader>3', function()
      harpoon:list():select(3)
    end, { desc = 'Navigate to mark [3]' })
    vim.keymap.set('n', '<leader>4', function()
      harpoon:list():select(4)
    end, { desc = 'Navigate to mark [4]' })
    vim.keymap.set('n', '<leader>5', function()
      harpoon:list():select(5)
    end, { desc = 'Navigate to mark [5]' })
  end,
}
