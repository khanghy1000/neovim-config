return {
  'mistweaverco/kulala.nvim',
  ft = { 'http', 'rest' },
  opts = {
    global_keymaps = true,
    global_keymaps_prefix = '<leader>r',
    kulala_keymaps_prefix = '',
  },
  config = function()
    local curl_path = 'curl'
    local os_name = require('custom.utils').get_os_name()
    if os_name == 'Windows' then
      curl_path = 'C:\\WINDOWS\\system32\\curl.exe'
    end
    require('kulala').setup {
      global_keymaps = true,
      global_keymaps_prefix = '<leader>r',
      kulala_keymaps_prefix = '',
      curl_path = curl_path,
    }
  end,
}
