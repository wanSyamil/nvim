return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.intelephense = opts.servers.intelephense or {}
      opts.servers.intelephense.settings = vim.tbl_deep_extend("force", opts.servers.intelephense.settings or {}, {
        intelephense = {
          diagnostics = {
            exclude = {
              ["*.php"] = { "P1132" },
            },
          },
        },
      })
    end,
  },
}
