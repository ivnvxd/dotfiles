-- Map the leader key to space.
vim.g.mapleader = ' '

local M = {}

M.general = {
  i = {
    ["jj"] = { "<Esc>", "exit insert mode"}
  },

  n = {
    -- Switch between splits
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },

    -- Move faster
    ["J"] = { "5j", "move 5 lines down" },
    ["K"] = { "5k", "move 5 lines up"},

    -- Save files
    -- ["<leader>w"] = { "<cmd> w <CR>", "save file" },

    -- Keep joining lines
    ["<leader>j"] = { "J", "join lines" },

    -- Delete a line without copying it
    ["<leader>d"] = { "_dd", "delete line without copying" },

    -- hop plugin (easymotion+sneak like)
    ["f"] = {
      function ()
        require('hop').hint_char1()
      end,
      "find 1 character"
    },

    ["t"] = {
      function ()
        require('hop').hint_char1({hint_offset = -1})
      end,
      "until 1 character"
    },

    ["s"] = {
      function ()
        require('hop').hint_char2()
      end,
      "find 2 characters",
    },

    ["<leader><leader>w"] = {
      function()
        require('hop').hint_words({
          direction = require('hop.hint').HintDirection.AFTER_CURSOR,
        })
      end,
      "start of words forward",
      },

    ["<leader><leader>b"] = {
      function()
        require('hop').hint_words({
          direction = require('hop.hint').HintDirection.BEFORE_CURSOR,
        })
      end,
      "start of words backwards",
      },

    ["<leader><leader>l"] = {
      function()
        require('hop').hint_lines_skip_whitespace()
      end,
      "beginning of lines",
      },
  },

  v = {
    ["s"] = {
      function ()
        require('hop').hint_char1()
      end,
      "find 1 character"
    },
  }
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    }
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require('dap-python').test_method()
      end
    }
  }
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require('dap-go').debug_test()
      end,
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function()
        require('dap-go').debug_last()
      end,
      "Debug last go test"
    }
  }
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags"
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags"
    }
  }
}

-- fix core mappings
M.lspconfig = {
  plugin = true,
  n = {

    ["<leader>k"] = {  -- was "K"
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },


    ["<leader>fd"] = {  -- was "<leader>f"
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },
  }
}

return M
