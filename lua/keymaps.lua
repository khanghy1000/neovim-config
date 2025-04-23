local utils = require 'custom.utils'

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Remove highlight
vim.keymap.set('n', '<Esc>', function()
  vim.cmd 'fclose!'
  vim.cmd 'nohlsearch'
end)

vim.keymap.set('n', '<C-c>', function()
  vim.cmd 'fclose!'
  vim.cmd 'nohlsearch'
end)

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>ld', vim.diagnostic.setloclist, { desc = 'Open [D]iagnostic quickfix list' })
vim.keymap.set('n', '<leader>k', vim.diagnostic.open_float, { desc = '[K] Show diagnostics under cursor' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set({ 'n', 'x' }, 's', '<Nop>')

-- disable marcos and close quickfix window
vim.keymap.set({ 'n', 'x' }, 'q', function()
  print(vim.bo.filetype)
  if vim.bo.filetype == 'qf' then
    vim.cmd 'q'
  end
end)

-- del without replace paste register
vim.keymap.set('n', 'D', '"_dd')
vim.keymap.set('x', 'D', '"_d')

-- paste in visual mode without replace paste register
vim.keymap.set('x', 'P', '"_dP`]')

-- yank/paste then move cursor to last pasted line
vim.keymap.set('n', 'p', 'p`]')
vim.keymap.set('x', 'p', 'p`]')
vim.keymap.set('x', 'y', 'y`]')

-- move half page then center screen
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- jump between paragraphs then center screen
vim.keymap.set('n', '{', '{zz')
vim.keymap.set('n', '}', '}zz')

-- jump between search then center screen
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Move code block up and down
vim.keymap.set('x', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('x', 'K', ":m '<-2<CR>gv=gv")

-- run tmux sessionizer
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

-- resize window
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>')
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>')
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>')

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd({ 'VimEnter' }, {
  callback = function()
    ---@diagnostic disable-next-line: param-type-mismatch
    if vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
      vim.cmd('cd ' .. vim.fn.argv(0))
    end
    ---@diagnostic disable-next-line: param-type-mismatch
    if vim.fn.argv(0) == '.' or vim.fn.argv(0) == '' or vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
      vim.cmd 'Neotree reveal action=show'
    end
  end,
})

-- vim: ts=2 sts=2 sw=2 et
