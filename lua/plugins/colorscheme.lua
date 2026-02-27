return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("config.rosepine")
    end,
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000, enabled = false },
}
