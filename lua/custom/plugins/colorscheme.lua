local function set_color(color)
  local colors = {
    'catppuccin-macchiato',
    'rose-pine-moon',
  }

  color = color or colors[1]

  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

  vim.api.nvim_set_hl(0, 'QuickScopePrimary', { fg = '#000000', bg = '#d29af7', underline = true })
  vim.api.nvim_set_hl(0, 'QuickScopeSecondary', { fg = '#000000', bg = '#c0caf5', underline = true })
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
