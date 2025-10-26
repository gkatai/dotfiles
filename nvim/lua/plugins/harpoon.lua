return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup()

    -- Load telescope extension
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end

    -- Keybindings
    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Add file" })
    vim.keymap.set("n", "<leader>hh", function() toggle_telescope(harpoon:list()) end, { desc = "Toggle menu" })

    -- Navigate to files 1-4
    vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end, { desc = "File 1" })
    vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end, { desc = "File 2" })
    vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end, { desc = "File 3" })
    vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end, { desc = "File 4" })

    -- Navigate to previous/next file with wrapping
    vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev({ wrap = true }) end, { desc = "Previous file" })
    vim.keymap.set("n", "<leader>hn", function() harpoon:list():next({ wrap = true }) end, { desc = "Next file" })
  end,
}
