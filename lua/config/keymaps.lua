-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.del("n", "<leader>1")
vim.keymap.del("n", "<leader>2")
vim.keymap.del("n", "<leader>3")
vim.keymap.del("n", "<leader>4")
vim.keymap.del("n", "<leader>5")
vim.keymap.del("n", "<leader>6")
vim.keymap.del("n", "<leader>7")
vim.keymap.del("n", "<leader>8")
vim.keymap.del("n", "<leader>9")
vim.keymap.del("n", "<C-s>")
vim.keymap.del("n", "L")
vim.keymap.del("n", "H")
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

vim.keymap.set("n", "<A-1>", function()
  harpoon:list():select(1)
end, { desc = "Harpoon File 1" })
vim.keymap.set("n", "<A-2>", function()
  harpoon:list():select(2)
end, { desc = "Harpoon File 2" })
vim.keymap.set("n", "<A-3>", function()
  harpoon:list():select(3)
end, { desc = "Harpoon File 3" })
vim.keymap.set("n", "<A-4>", function()
  harpoon:list():select(4)
end, { desc = "Harpoon File 4" })
vim.keymap.set("n", "<A-5>", function()
  harpoon:list():select(5)
end, { desc = "Harpoon File 5" })
vim.keymap.set("n", "<A-6>", function()
  harpoon:list():select(6)
end, { desc = "Harpoon File 6" })
vim.keymap.set("n", "<A-7>", function()
  harpoon:list():select(7)
end, { desc = "Harpoon File 7" })
vim.keymap.set("n", "<A-8>", function()
  harpoon:list():select(8)
end, { desc = "Harpoon File 8" })
vim.keymap.set("n", "<A-9>", function()
  harpoon:list():select(9)
end, { desc = "Harpoon File 9" })

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
