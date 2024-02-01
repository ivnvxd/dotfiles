return {
  -- Set catppuccin as default colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
    },
  },

  -- Disable first suggestion autoselect
  {
    "hrsh7th/nvim-cmp",
    opts = {
      completion = {
        completeopt = "menu,menuone,noinsert,noselect,preview",
      },
    },
  },

  -- Remove file explorer title
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        offsets = {
          {
            filetype = "neo-tree",
            text = "",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
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

  -- Change popup border style to rounded
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      popup_border_style = "rounded",
    },
  },

  -- Remove animation from indent guides
  {
    "echasnovski/mini.indentscope",
    opts = {
      draw = {
        delay = 0,
        animation = require("mini.indentscope").gen_animation.none(),
      },
    },
  },
}
