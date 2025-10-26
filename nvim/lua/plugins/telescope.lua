return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({
      defaults = {
        file_ignore_patterns = { "node_modules", ".git/", "build", "external" },
      },
      pickers = {
        find_files = {
          hidden = true,  -- Show hidden files
        },
      },
    })
  end,
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>" },
  },
}
