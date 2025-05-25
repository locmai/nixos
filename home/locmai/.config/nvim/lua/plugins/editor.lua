return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>e", "<cmd>Neotree reveal float toggle<cr>", desc = "Toggle NeoTree" },
    },
  },
  {
    "folke/zen-mode.nvim",
  },
  {
    "3rd/image.nvim",
    build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
    opts = {
        processor = "magick_cli",
    }
  },
  {
    "dinhhuy258/git.nvim",
    event = "BufReadPre",
    opts = {
      keymaps = {
        -- Open blame window
        blame = "<leader>gb",
        -- Open file/folder in git repository
        -- browse = "<Leader>go",
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "float",
      },
    },
  },
  { "MeanderingProgrammer/render-markdown.nvim" },
  { "github/copilot.vim" },
}
