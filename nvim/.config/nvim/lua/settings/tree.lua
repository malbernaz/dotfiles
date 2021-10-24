return function()
  local tree = require("nvim-tree")

  vim.cmd([[ highlight NvimTreeNormal guibg=#FFF ]])
  -- vim.cmd([[
  --   let g:nvim_tree_show_icons = {
  --   \ 'git': 0,
  --   \ 'folders': 0,
  --   \ 'files': 0,
  --   \ 'folder_arrows': 1,
  --   \ }
  -- ]])

  tree.setup({
    auto_close = true,
    view = {
      width = 40,
      height = 40,
      auto_resize = true,
    },
  })
end
