-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Exit insert mode
map("i", "jj", "<ESC>", { silent = true, remap = true })
map("i", "jk", "<ESC>", { silent = true, remap = true })
map("i", "kj", "<ESC>", { silent = true, remap = true })

-- Move Lines up and down
map("n", "<A-down>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-up>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-down>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-up>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Navigate between vim and tmux splits
map({ "i", "x", "n", "s" }, "<A-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Navigate left" })
map({ "i", "x", "n", "s" }, "<A-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Navigate down" })
map({ "i", "x", "n", "s" }, "<A-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Navigate up" })
map({ "i", "x", "n", "s" }, "<A-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Navigate right" })
