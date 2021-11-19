return function()
  local tree = require("nvim-tree")

  tree.setup({
    auto_close = true,
    view = {
      width = 40,
      height = 40,
      auto_resize = true,
    },
  })

  vim.cmd([[ highlight NvimTreeNormal guibg=#1E1E1E ]])
end
