-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Exit insert mode
map("i", "jj", "<ESC>", { silent = true, remap = true })
map("i", "jk", "<ESC>", { silent = true, remap = true })
map("i", "kj", "<ESC>", { silent = true, remap = true })

-- Move in insert mode
map("i", "<C-h>", "<Left>", { silent = true, remap = true })
map("i", "<C-j>", "<Down>", { silent = true, remap = true })
map("i", "<C-k>", "<Up>", { silent = true, remap = true })
map("i", "<C-l>", "<Right>", { silent = true, remap = true })
