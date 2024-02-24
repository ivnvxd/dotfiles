return {
  -- Navigate seamlessly between vim and tmux splits
  {
    "christoomey/vim-tmux-navigator",
    -- cmd = {
    --   "TmuxNavigateLeft",
    --   "TmuxNavigateDown",
    --   "TmuxNavigateUp",
    --   "TmuxNavigateRight",
    --   "TmuxNavigatePrevious",
    -- },
    -- keys = {
    --   { "<A-h>", "<cmd>TmuxNavigateLeft<cr>", remap = true },
    --   { "<A-j>", "<cmd>TmuxNavigateDown<cr>", remap = true },
    --   { "<A-k>", "<cmd>TmuxNavigateUp<cr>", remap = true },
    --   { "<A-l>", "<cmd>TmuxNavigateRight<cr>", remap = true },
    --   { "<A-\\>", "<cmd>TmuxNavigatePrevious<cr>", remap = true },
    -- },
  },

  -- Automatically expand width of the current window
  -- {
  --   "anuvyklack/windows.nvim",
  --   dependencies = {
  --     "anuvyklack/middleclass",
  --     "anuvyklack/animation.nvim",
  --   },
  --   config = function()
  --     vim.o.winwidth = 10
  --     vim.o.winminwidth = 10
  --     vim.o.equalalways = false
  --     require("windows").setup()
  --   end,
  -- },

  -- File explorer that lets you edit your filesystem like a normal Neovim buffer
  {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open Oil" },
    },
  },
}
