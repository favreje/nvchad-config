-- These are from my previous configuration - possibly before NvChad 2.5?
local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities
local util = require "lspconfig/util"
--

-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}
--
-- Python
lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
}

-- C
lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Go
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

-- SQL
lspconfig.sqls.setup {
  cmd = { "sqls" },
  filetypes = { "sql" },
  root_dir = lspconfig.util.root_pattern(".git", ".sqls.yml"),
  on_attach = function(client, bufnr)
    -- Disable formatting capabilities
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    -- Apply other NvChad settings
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}
