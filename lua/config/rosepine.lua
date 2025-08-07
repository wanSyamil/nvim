-- Theme: Rosé Pine
require("rose-pine").setup({
  variant = "auto", -- "main", "moon", "dawn", or "auto"
  dark_variant = "main",
  disable_background = false,
  disable_italics = false,
  styles = {
    transparency = true,
    bold = true,
    italic = true,
  },
})

vim.cmd("colorscheme rose-pine")

