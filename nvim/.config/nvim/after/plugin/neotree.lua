local map = require("malbernaz.utils").map
local palette = require("monokai.palette")

require("window-picker").setup({
  autoselect_one = true,
  include_current = false,
  filter_rules = {
    bo = {
      filetype = { "neo-tree", "neo-tree-popup", "notify", "quickfix" },
      buftype = { "terminal" },
    },
  },
  fg_color = palette.base1,
  other_win_hl_color = palette.orange,
})

require("neo-tree").setup({
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
    },
  },
})

map("n", "<c-n>", ":Neotree toggle<cr>")
map("n", "<leader>n", ":Neotree reveal_file=%<cr>")
