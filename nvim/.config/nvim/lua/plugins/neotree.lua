return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    -- default_component_configs = {
    --   git_status = {
    --     symbols = {
    --       -- Change type
    --       added = "",
    --       deleted = "",
    --       modified = "",
    --       renamed = "",
    --       -- Status type
    --       untracked = "",
    --       ignored = "",
    --       unstaged = "",
    --       staged = "",
    --       conflict = "",
    --     },
    --   },
    -- },
    close_if_last_window = true,
    popup_border_style = "rounded",
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
  },
}
