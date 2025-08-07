-- Keymaps for Neovim

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Space as leader
vim.g.mapleader = " "

-- Save file
map("n", "<leader>w", ":w<CR>", opts)

-- Quit
map("n", "<leader>q", ":q<CR>", opts)

-- Save & quit
map("n", "<leader>x", ":x<CR>", opts)

-- Reload config
map("n", "<leader>r", ":source $MYVIMRC<CR>", opts)

-- Clear search highlight
map("n", "<leader>h", ":nohlsearch<CR>", opts)

-- Telescope (if installed)
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Open Lazy.nvim
map("n", "<leader>l", ":Lazy<CR>", opts)

