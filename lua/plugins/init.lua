return {
    { "folke/lazy.nvim" },
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("config.rosepine")
        end,
    }
}
