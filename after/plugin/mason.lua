require("mason").setup()
require("mason-lspconfig").setup()

-- After setting up mason-lspconfig you may set up servers via lspconfig
-- require("lspconfig").lua_ls.setup {}
-- require("lspconfig").rust_analyzer.setup {}
-- ...
--

-- Python 
-- require('lspconfig').jedi_language_server.setup({
--   settings = {
--     jedi = {
--       dynamic_params = true,
--       dynamic_array_additions = true,
--     }
--   }
-- }
-- )
require('lspconfig').pyright.setup{
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        typeCheckingMode = "basic",  -- or "strict" if you prefer
      },
    },
  },
}

-- C 
require('lspconfig').clangd.setup({})

-- Lua
require('lspconfig').lua_ls.setup({})

-- JavaScript
require('lspconfig').eslint.setup({
  settings = {
    packageManager = 'yarn'
  },
  ---@diagnostic disable-next-line: unused-local
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})

-- Typescript
require('lspconfig').ts_ls.setup({})

-- CSS
require('lspconfig').cssls.setup({})
