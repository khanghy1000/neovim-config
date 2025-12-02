local function set_color(color)
  local colors = {
    'catppuccin-macchiato',
    'rose-pine-moon',
    'phobos-anomaly',
    'vague',
  }

  color = color or colors[1]

  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end

return {
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    opts = {
      transparent = true,
    },
    init = function() set_color() end,
  },
  {
    'EdenEast/nightfox.nvim',
    priority = 1000,
    opts = { options = { transparent = true } },
    init = function() set_color() end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = {
      transparent_background = true,
      custom_highlights = function(colors)
        return {
          CmpItemAbbrMatch = { style = {} },
          CmpItemAbbrMatchFuzzy = { style = {} },
          -- PmenuSel = { style = {} },
        }
      end,
    },
    init = function() set_color() end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    opts = {
      styles = {
        italic = false,
        transparency = true,
      },
    },
    init = function() set_color() end,
  },
  {
    'mcauley-penney/phobos-anomaly.nvim',
    priority = 1000,
    init = function() set_color() end,
  },
  {
    'vague-theme/vague.nvim',
    priority = 1000,
    init = function() set_color() end,
  },
}
