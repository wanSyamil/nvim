-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- 🧩 Dadbod UI connections
-- These will be detected automatically when you open :DBUI
vim.g.dbs = {
  my_postgres = "postgresql://postgres:password@localhost:5432/postgres",
}

-- Optional: tell Dadbod UI to run table helpers automatically
vim.g.db_ui_auto_execute_table_helpers = 1
