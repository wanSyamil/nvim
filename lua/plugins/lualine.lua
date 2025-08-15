return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.sections.lualine_c = {
      {
        "filename",
        path = 2, -- 0 = just filename, 1 = relative path, 2 = absolute path
      },
    }
  end,
}
