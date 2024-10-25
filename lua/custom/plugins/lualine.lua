return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local indent_info = function()
      if vim.api.nvim_buf_get_name(0) == '' then
        return ''
      end

      if vim.bo.expandtab then
        return 'S:' .. vim.bo.shiftwidth
      else
        return 'T:' .. vim.bo.tabstop
      end
    end

    require('lualine').setup {
      options = {
        component_separators = { left = '|', right = '|' },
        section_separators = '',
      },
      sections = {
        lualine_x = {
          'encoding',
          {
            'fileformat',
            icons_enabled = true,
            symbols = {
              unix = 'LF',
              dos = 'CRLF',
              mac = 'CR',
            },
          },
          'filetype',
          indent_info,
        },
      },
    }
  end,
}
