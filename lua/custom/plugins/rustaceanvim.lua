return {
  'mrcjkb/rustaceanvim',
  version = '^6', -- Recommended
  lazy = false, -- This plugin is already lazy
  config = function()
    vim.g.rustaceanvim = {
      server = {
        on_attach = function(client, bufnr)
          vim.keymap.set(
            { 'n', 'x' },
            'gra',
            function() vim.cmd.RustLsp 'codeAction' end,
            { silent = true, buffer = bufnr, desc = 'Rust LSP: [G]oto Code [A]ction' }
          )
          vim.keymap.set('n', 'K', function() vim.cmd.RustLsp { 'hover', 'actions' } end, { silent = true, buffer = bufnr, desc = 'Rust LSP: Hover actions' })
          vim.keymap.set(
            'n',
            '<leader>dr',
            function() vim.cmd.RustLsp 'renderDiagnostic' end,
            { silent = true, buffer = bufnr, desc = 'Rust LSP: [R]ender Rust diagnostics' }
          )
        end,
      },
    }
  end,
}
