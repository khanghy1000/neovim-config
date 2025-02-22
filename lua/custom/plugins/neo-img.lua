return {
  'skardyy/neo-img',
  build = function()
    require('neo-img').install()
  end,
  config = function()
    require('neo-img').setup {}
  end,
}
