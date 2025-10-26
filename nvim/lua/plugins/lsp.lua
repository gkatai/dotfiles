local capabilities = require("cmp_nvim_lsp").default_capabilities()
local on_attach = require("lsp.on_attach")

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- Configure diagnostics
    vim.diagnostic.config({
      virtual_text = {
        spacing = 4,
        prefix = '●',
      },
      signs = true,
      underline = true,
      update_in_insert = false,
    })

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "clangd", "eslint" },
    })

    vim.lsp.config('clangd', {
      cmd = { 'clangd' },
      on_attach = on_attach,
      capabilities = capabilities,
    })

    vim.lsp.config('eslint', {
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        -- Auto-fix on save
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
      end,
      capabilities = capabilities,
    })

    vim.lsp.enable('clangd')  -- Enable it for all buffers
    vim.lsp.enable('eslint')  -- Enable it for all buffers
  end,
}
