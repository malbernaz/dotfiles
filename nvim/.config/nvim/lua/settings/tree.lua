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
end
