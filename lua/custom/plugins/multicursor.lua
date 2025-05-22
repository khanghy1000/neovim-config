return {
  'jake-stewart/multicursor.nvim',
  branch = '1.0',
  -- enabled = false,
  -- event = 'BufRead',
  config = function()
    local mc = require 'multicursor-nvim'
    local set = vim.keymap.set
    mc.setup()

    -- Add or skip adding a new cursor by matching word/selection
    set({ 'n', 'v' }, '<M-.>', function()
      mc.matchAddCursor(1)
    end, { desc = 'Add cursor to next matched word' })
    set({ 'n', 'v' }, '<C-.>', function()
      mc.matchSkipCursor(1)
    end, { desc = '[J] Skip cursor to next matched word' })
    set({ 'n', 'v' }, '<M-,>', function()
      mc.matchAddCursor(-1)
    end, { desc = 'Add cursor to previous matched word' })
    set({ 'n', 'v' }, '<C-,>', function()
      mc.matchSkipCursor(-1)
    end, { desc = '[K] Skip cursor to previous matched word' })

    -- Add and remove cursors with control + left click.
    set('n', '<c-leftmouse>', mc.handleMouse)

    local utils = require 'custom.utils'

    local escape = function()
      if not mc.cursorsEnabled() then
        mc.enableCursors()
      elseif mc.hasCursors() then
        mc.clearCursors()
      else
        vim.cmd 'fclose!'
        vim.cmd 'nohlsearch'
        vim.api.nvim_feedkeys(vim.keycode '<esc>', 'n', false)
      end
    end

    set('n', '<esc>', escape, { desc = 'Clear cursors' })

    set('n', '<C-c>', escape, { desc = 'Clear cursors' })

    -- match new cursors within visual selections by regex.
    set('v', 'M', mc.matchCursors, { desc = 'Match cursors within visual selections' })

    -- Customize how cursors look.
    local hl = vim.api.nvim_set_hl
    hl(0, 'MultiCursorCursor', { link = 'Cursor' })
    hl(0, 'MultiCursorVisual', { link = 'Visual' })
    hl(0, 'MultiCursorSign', { link = 'SignColumn' })
    hl(0, 'MultiCursorDisabledCursor', { link = 'Visual' })
    hl(0, 'MultiCursorDisabledVisual', { link = 'Visual' })
    hl(0, 'MultiCursorDisabledSign', { link = 'SignColumn' })
  end,
}
