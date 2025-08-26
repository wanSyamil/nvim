return {
  { "folke/lazy.nvim" },
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate", -- Automatically runs :TSUpdate when the plugin is installed/updated
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "php", "blade" }, -- Ensure PHP and Blade parsers are installed
        highlight = {
          enable = true, -- Enable Treesitter-based highlighting
          additional_vim_regex_highlighting = false, -- Disable regex highlighting in favor of Treesitter
        },
        indent = {
          enable = true, -- Enable indentation
        },
        modules = {}, -- Empty modules, can add specific ones if needed
        sync_install = true, -- Automatically installs missing parsers
        ignore_install = {}, -- Ignore specific parsers, leave empty if none
        auto_install = true, -- Automatically install parsers if missing
      })

      -- Automatically set PHP syntax for Blade files with inline PHP
      vim.cmd([[
        augroup blade_php_filetypes
          autocmd!
          autocmd FileType blade,php setlocal syntax=php
        augroup END
      ]])
    end,
  },
  {
    "ricardoramirezr/blade-nav.nvim",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    ft = { "blade", "php" },
  },
}
