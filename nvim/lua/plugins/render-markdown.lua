return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "echasnovski/mini.nvim",
  },
  ft = "markdown", -- Load only for markdown files
  opts = {},
  config = function()
    require("render-markdown").setup({})
  end,
}
