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
      ensure_installed = { "clangd" },
    })

    vim.lsp.config('clangd', {
      cmd = { 'clangd' },
      on_attach = on_attach,
      capabilities = capabilities,
    })

    vim.lsp.enable('clangd')  -- Enable it for all buffers
  end,
}
