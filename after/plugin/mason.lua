require("mason").setup()
require("mason-lspconfig").setup()

-- After setting up mason-lspconfig you may set up servers via lspconfig
-- require("lspconfig").lua_ls.setup {}
-- require("lspconfig").rust_analyzer.setup {}
-- ...
require('lspconfig').pylsp.setup({})
require('lspconfig').clangd.setup({})
require('lspconfig').lua_ls.setup({})
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
require('lspconfig').ts_ls.setup({})
