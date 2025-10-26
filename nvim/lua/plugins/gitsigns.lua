return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  config = function()
    require("gitsigns").setup({
      signs = {
        add          = { text = '│' },
        change       = { text = '│' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      current_line_blame = false, -- Toggle with <leader>gb
      current_line_blame_opts = {
        delay = 500,
      },
    })

    -- Keybindings
    local gs = require('gitsigns')

    vim.keymap.set('n', '<leader>gs', gs.stage_hunk, { desc = 'Stage hunk' })
    vim.keymap.set('n', '<leader>gr', gs.reset_hunk, { desc = 'Reset hunk' })
    vim.keymap.set('n', '<leader>gS', gs.stage_buffer, { desc = 'Stage buffer' })
    vim.keymap.set('n', '<leader>gu', gs.undo_stage_hunk, { desc = 'Undo stage hunk' })
    vim.keymap.set('n', '<leader>gR', gs.reset_buffer, { desc = 'Reset buffer' })
    vim.keymap.set('n', '<leader>gp', gs.preview_hunk, { desc = 'Preview hunk' })
    vim.keymap.set('n', '<leader>gb', gs.toggle_current_line_blame, { desc = 'Toggle blame' })
    vim.keymap.set('n', '<leader>gd', gs.diffthis, { desc = 'Diff this' })

    -- Navigation
    vim.keymap.set('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, { expr = true, desc = 'Next hunk' })

    vim.keymap.set('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, { expr = true, desc = 'Previous hunk' })
  end,
}
