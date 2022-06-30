return function()
  local map = require("malbernaz.utils").map

  require("nvim-tree").setup({
    view = {
      width = 40,
    },
    renderer = {
      icons = {
        show = {
          git = false,
        },
      },
    },
  })

  map("n", "<leader>n", ":NvimTreeToggle<cr>")
  map("n", "<leader>nf", ":NvimTreeFindFile<cr>")
end
