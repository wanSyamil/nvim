-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function del_if_mapped(mode, lhs)
  if vim.fn.maparg(lhs, mode) ~= "" then
    vim.keymap.del(mode, lhs)
  end
end

del_if_mapped("n", "<C-s>")
del_if_mapped("n", "L")
del_if_mapped("n", "H")

vim.keymap.set({ "n", "v" }, "q", "<Nop>", { noremap = true, silent = true })
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

-- Harpoon keymaps
local harpoon = require("harpoon")
harpoon:setup()
del_if_mapped("n", "<leader>1")
del_if_mapped("n", "<leader>2")
del_if_mapped("n", "<leader>3")
del_if_mapped("n", "<leader>4")
del_if_mapped("n", "<leader>5")
del_if_mapped("n", "<leader>6")
del_if_mapped("n", "<leader>7")
del_if_mapped("n", "<leader>8")
del_if_mapped("n", "<leader>9")

vim.keymap.set("n", "<A-q>", function() harpoon:list():prev() end, { desc = "Harpoon Previous" })
vim.keymap.set("n", "<A-e>", function() harpoon:list():next() end, { desc = "Harpoon Next" })

-- Dadbod keymaps
vim.keymap.set("n", "<leader>d", "<cmd>DBUIToggle<CR>", { desc = "Toggle Dadbod UI" })
vim.keymap.set("v", "<CR>", ":DB<CR>", { desc = "Run selected SQL query (Dadbod)" })

-- Toggle mouse
vim.keymap.set("n", "<leader>um", function()
  local mouse_setting = vim.o.mouse

  if mouse_setting == "a" then
    vim.o.mouse = ""
    vim.notify("Mouse disabled", vim.log.levels.WARN)
  else
    vim.o.mouse = "a"
    vim.notify("Mouse enabled", vim.log.levels.INFO)
  end
end, { desc = "Toggle Mouse" })

-- Text case conversion (g-prefix)
vim.keymap.set({ "n", "x" }, "<leader>sc", "<cmd>TextCaseOpenTelescope<CR>", { desc = "Text Case Picker" })
