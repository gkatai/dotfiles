return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",     -- LSP completion source
    "hrsh7th/cmp-buffer",       -- Buffer text completion
    "hrsh7th/cmp-path",         -- File path completion
  },
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),      -- Trigger completion
        ["<C-e>"] = cmp.mapping.abort(),             -- Close completion
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept suggestion
        ["<Tab>"] = cmp.mapping.select_next_item(),  -- Next suggestion
        ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- Previous suggestion
      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp" },  -- LSP suggestions
        { name = "buffer" },    -- Text from current buffer
        { name = "path" },      -- File paths
      }),
    })
  end,
}
