return {
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
        position = "right",
      },
    },
  },
  { "MeanderingProgrammer/render-markdown.nvim" },
  { "github/copilot.vim" },
}
