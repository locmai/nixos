return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      routes = {
        {
          filter = {
            event = "notify",
            error = true,
            find = "Invalid offset LineCol",
          },
          opts = { skip = true },
        },
      },
    },
  },
}
