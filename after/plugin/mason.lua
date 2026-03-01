require("mason").setup()
require("mason-lspconfig").setup()

-- 1. Get your completion capabilities (from your other file)
local caps = require('cmp_nvim_lsp').default_capabilities()

-- 2. Define your server configurations
local servers = {
  pyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          typeCheckingMode = "basic",
        },
      },
    },
  },
  clangd = {},
  lua_ls = {},
  ts_ls = {},
  cssls = {},
  eslint = {
    settings = { packageManager = 'yarn' },
    -- We can still use on_attach for server-specific logic
    on_attach = function(client, bufnr)
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        command = "EslintFixAll",
      })
    end,
  },
}

-- 3. Enable the servers using the new 0.11 API
for server, config in pairs(servers) do
  config.capabilities = caps
  vim.lsp.enable(server, config)
end
