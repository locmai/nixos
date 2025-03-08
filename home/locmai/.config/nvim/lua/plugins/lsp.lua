return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("custom.lspconfig").defaults()
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "ruff_format" },
        rust = { "rustfmt", lsp_format = "fallback" },
        hcl = { "hclfmt" },
        nix = { "alejandra" },
        go = { "gofmt", "goimports" },
        json = { "json_tool" },
        tf = { "tofu fmt" },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = {
      "go",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "markdown",
      "markdown_inline",
      "rust",
      "jsonnet",
      "hcl",
      "terraform",
    },

    auto_install = true,
  },
}
