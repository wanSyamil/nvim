-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "xml", "blade", "blade.php" },
  callback = function()
    vim.opt_local.commentstring = "<!-- %s -->"
  end,
})

-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Caps Lock → Snacks notifier (top-right). Uses Linux keyboard LED sysfs.
do
  local CAPS_NOTIFY_ID = "lazyvim_capslock"

  ---@param msg string
  ---@param opts snacks.notifier.Notif.opts
  local function caps_notify(msg, opts)
    local S = rawget(_G, "Snacks")
    if S then
      S.notifier.notify(msg, vim.log.levels.WARN, opts)
    end
  end

  local function caps_notify_hide()
    local S = rawget(_G, "Snacks")
    if S and S.notifier.hide then
      S.notifier.hide(CAPS_NOTIFY_ID)
    end
  end

  ---@return boolean?
  local function caps_lock_on()
    local paths = vim.fn.glob("/sys/class/leds/*capslock*/brightness", false, true)
    if #paths == 0 then
      return nil
    end
    for _, path in ipairs(paths) do
      local f = io.open(path, "r")
      if f then
        local line = f:read("*l")
        f:close()
        local n = line and tonumber((vim.trim(line)))
        if n and n > 0 then
          return true
        end
      end
    end
    return false
  end

  local caps_last ---@type boolean?
  local caps_timer ---@type uv.uv_timer?

  local function caps_poll()
    local on = caps_lock_on()
    if on == nil then
      return
    end
    if caps_last == nil then
      caps_last = on
      if on then
        caps_notify("Caps Lock is on", {
          title = "Keyboard",
          id = CAPS_NOTIFY_ID,
          timeout = false,
        })
      end
      return
    end
    if on == caps_last then
      return
    end
    caps_last = on
    if on then
      caps_notify("Caps Lock is on", {
        title = "Keyboard",
        id = CAPS_NOTIFY_ID,
        timeout = false,
      })
    else
      caps_notify_hide()
    end
  end

  local function setup_capslock_notify()
    if caps_lock_on() == nil then
      return
    end
    caps_timer = vim.uv.new_timer()
    caps_timer:start(500, 500, function()
      vim.schedule(caps_poll)
    end)
    vim.api.nvim_create_autocmd("VimLeavePre", {
      group = vim.api.nvim_create_augroup("config_capslock_notify", { clear = true }),
      callback = function()
        if caps_timer and not caps_timer:is_closing() then
          caps_timer:stop()
          caps_timer:close()
        end
      end,
    })
  end

  -- LazyVim loads autocmds on `VeryLazy` when `argc(-1) == 0`; otherwise they load earlier.
  if vim.fn.argc(-1) == 0 then
    setup_capslock_notify()
  else
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      once = true,
      callback = setup_capslock_notify,
    })
  end
end
