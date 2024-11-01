-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()
local lspconfig = require "lspconfig"

local servers = {
  "html",
  "cssls",
  "rust_analyzer",
  "ruff_lsp",
  "nil_ls",
  "jsonnet_ls",
  "yamlls",
  "gopls",
  "dagger",
  "terraformls"
}
local nvlsp = require "nvchad.configs.lspconfig"

local function custom_on_attach(client, bufnr)
  nvlsp.on_attach(client, bufnr)

  vim.keymap.set("n", "gl", function()
    local found_float = false
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_config(win).relative ~= "" then
        vim.api.nvim_win_close(win, true)
        found_float = true
      end
    end

    if found_float then
      return
    end

    vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
  end, { desc = "Toggle Diagnostics" })
end

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = custom_on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
