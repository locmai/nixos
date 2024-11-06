return {
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    ui = {
      icons = {
        package_pending = " ",
        package_installed = " ",
        package_uninstalled = " ",
      },
    },
    max_concurrent_installers = 10,
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "rust-analyzer",
        "helm-ls",
        "ruff-lsp",
        "yaml-language-server",
        "gopls",
        "nil",
        "jsonnet-language-server",
        "terraform-ls",
      })
    end,
  },
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
      },
    },
  },
}
