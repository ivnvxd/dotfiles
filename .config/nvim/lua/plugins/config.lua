return {
  -- Set catppuccin as default colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
      -- colorscheme = "catppuccin-macchiato",
    },
  },

  -- Add Vim icon to current mode indicator in statusline
  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      return {
        sections = {
          lualine_a = { { "mode", icon = " " } },
        },
      }
    end,
  },
}