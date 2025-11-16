return {
  'folke/sidekick.nvim',
  opts = {
    nes = { enabled = false },
  },
  keys = {
    {
      '<tab>',
      function()
        -- if there is a next edit, jump to it, otherwise apply it if any
        if not require('sidekick').nes_jump_or_apply() then
          return '<Tab>' -- fallback to normal tab
        end
      end,
      expr = true,
      desc = 'Sidekick: Goto/Apply Next Edit Suggestion',
    },
    {
      '<M-a>',
      function() require('sidekick.cli').toggle() end,
      desc = 'Sidekick: Toggle',
      mode = { 'n', 't', 'i', 'x' },
    },
    {
      'gaa',
      function() require('sidekick.cli').toggle() end,
      desc = 'Sidekick: Toggle CLI',
    },
    {
      'gas',
      function() require('sidekick.cli').select() end,
      -- Or to select only installed tools:
      -- require("sidekick.cli").select({ filter = { installed = true } })
      desc = 'Sidekick: [S]elect CLI',
    },
    {
      'gad',
      function() require('sidekick.cli').close() end,
      desc = 'Sidekick: [D]etach a CLI Session',
    },
    {
      'gat',
      function() require('sidekick.cli').send { msg = '{this}' } end,
      mode = { 'x', 'n' },
      desc = 'Sidekick: [S]end This',
    },
    {
      'gaf',
      function() require('sidekick.cli').send { msg = '{file}' } end,
      desc = 'Sidekick: Send [F]ile',
    },
    {
      'gav',
      function() require('sidekick.cli').send { msg = '{selection}' } end,
      mode = { 'x' },
      desc = 'Sidekick: Send [V]isual Selection',
    },
    {
      'gap',
      function() require('sidekick.cli').prompt() end,
      mode = { 'n', 'x' },
      desc = 'Sidekick: Select [P]rompt',
    },
    {
      'gag',
      function() require('sidekick.cli').toggle { name = 'gemini', focus = true } end,
      desc = 'Sidekick: Toggle [G]emini',
    },
    {
      'gao',
      function() require('sidekick.cli').toggle { name = 'opencode', focus = true } end,
      desc = 'Sidekick: Toggle [O]pencode',
    },
  },
}
