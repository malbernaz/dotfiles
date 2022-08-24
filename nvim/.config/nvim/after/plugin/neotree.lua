local map = require("malbernaz.utils").map

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
