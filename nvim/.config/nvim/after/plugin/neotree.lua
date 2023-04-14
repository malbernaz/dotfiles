local map = require("malbernaz.utils").map
local colors = require("tokyonight.colors").default

require("window-picker").setup({
  autoselect_one = true,
  include_current = false,
  filter_rules = {
    bo = {
      filetype = { "neo-tree", "neo-tree-popup", "notify", "quickfix" },
      buftype = { "terminal" },
    },
  },
  fg_color = colors.blue,
  other_win_hl_color = colors.fg_gutter,
})

require("neo-tree").setup({
  close_if_last_window = true,
  popup_border_style = "rounded",
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
    },
  },
  window = {
    mappings = {
      ["<2-LeftMouse>"] = "open_with_window_picker",
      ["<cr>"] = "open_with_window_picker",
    },
  },
})

map("n", "<c-n>", ":Neotree toggle<cr>")
map("n", "<leader>n", ":Neotree reveal_file=%<cr>")
