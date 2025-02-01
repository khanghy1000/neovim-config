local function set_color(color)
  local colors = {
    'rose-pine-moon',
    'kanagawa-dragon',
    'nightfox',
    'catppuccin-macchiato',
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
    init = function()
      set_color()
    end,
  },
  {
    'EdenEast/nightfox.nvim',
    priority = 1000,
    opts = { options = { transparent = true } },
    init = function()
      set_color()
    end,
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
    init = function()
      set_color()
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    opts = {
      styles = {
        italic = false,
        transparency = true,
      },
    },
    init = function()
      set_color()
    end,
  },
}
