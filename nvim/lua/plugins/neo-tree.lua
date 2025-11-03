return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      
      default_component_configs = {
        indent = {
          indent_size = 2,
          padding = 1,
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "󰜌",
          default = "",
        },
        git_status = {
          symbols = {
            added     = "✚",
            modified  = "",
            deleted   = "✖",
            renamed   = "󰁕",
            untracked = "",
            ignored   = "",
            unstaged  = "󰄱",
            staged    = "",
            conflict  = "",
          }
        },
      },
      
      window = {
        position = "left",
        width = 30,
        mappings = {
          -- Minimal mappings since you'll use Oil for most operations
          ["<space>"] = "none", -- Disable space to avoid conflicts
          ["<cr>"] = "open",
          ["l"] = "open",
          ["h"] = "close_node",
          ["q"] = "close_window",
          ["R"] = "refresh",
          ["?"] = "show_help",
          ["-"] = "navigate_up", -- Keep consistent with Oil's "-" for going up
          ["<esc>"] = "cancel",
        },
      },
      
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            "node_modules",
            ".git",
            ".DS_Store",
          },
          never_show = {
            ".git",
            ".DS_Store",
          },
        },
        -- KEY FEATURE: Auto-follow current file for location awareness
        follow_current_file = {
          enabled = true, -- This will automatically highlight where you are
          leave_dirs_open = false, -- Collapse other dirs for cleaner view
        },
        use_libuv_file_watcher = true, -- Auto-refresh on external changes
        
        -- When you do open a file from neo-tree, use Oil instead
        hijack_netrw_behavior = "open_default",
      },
      
      buffers = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
      },
      
      -- Event handlers for better integration
      event_handlers = {
        {
          event = "file_opened",
          handler = function()
            -- Optional: auto-close neo-tree after opening a file
            -- Uncomment if you want it to close automatically
            -- require("neo-tree.command").execute({ action = "close" })
          end
        },
      },
    })
  end,
  keys = {
    -- Simple toggle - your main interaction with neo-tree
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle file tree (location reference)" },
    -- Reveal current file (useful if you navigated away in the tree)
    { "<leader>\\", "<cmd>Neotree reveal<cr>", desc = "Reveal current file in tree" },
  },
}
