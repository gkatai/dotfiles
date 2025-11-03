return function(client, bufnr)
  local wk = require("which-key")

  -- Register LSP keybindings with which-key
  wk.add({
    -- Navigation
    { "gd", vim.lsp.buf.definition, buffer = bufnr, desc = "Go to definition" },
    { "gr", vim.lsp.buf.references, buffer = bufnr, desc = "Find references" },
    { "K", vim.lsp.buf.hover, buffer = bufnr, desc = "Hover documentation" },

    -- Diagnostics navigation
    { "[d", vim.diagnostic.goto_prev, buffer = bufnr, desc = "Previous diagnostic" },
    { "]d", vim.diagnostic.goto_next, buffer = bufnr, desc = "Next diagnostic" },

    -- Leader-based commands
    { "<leader>e", vim.diagnostic.open_float, buffer = bufnr, desc = "Show diagnostic" },
    { "<leader>rn", vim.lsp.buf.rename, buffer = bufnr, desc = "Rename symbol" },
    { "<leader>ca", vim.lsp.buf.code_action, buffer = bufnr, desc = "Code action" },
    { "<leader>fm", function() vim.lsp.buf.format({ bufnr = bufnr }) end, buffer = bufnr, desc = "Format buffer" },
  })

  -- Formatting on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end,
    })
  end
end
