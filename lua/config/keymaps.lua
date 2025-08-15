-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- disabled keymaps
vim.keymap.set("n", "<C-z>", "<Nop>")

-- Normal + Visual delete/change go to black hole register
vim.keymap.set({ "n", "x" }, "d", '"_d', { noremap = true, silent = true })
vim.keymap.set({ "n", "x" }, "c", '"_c', { noremap = true, silent = true })
vim.keymap.set({ "n", "x" }, "s", '"_s', { noremap = true, silent = true })
vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true })

-- Paste without overwriting clipboard
vim.keymap.set("x", "p", '"_dP', { desc = "[P]ut without yanking" })
-- vim.keymap.set({ "n", "x" }, "p", '"0p', { noremap = true, silent = true })
-- vim.keymap.set({ "n", "x" }, "p", '"0p', { noremap = true, silent = true })
