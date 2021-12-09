return function()
  local zen = require("zen-mode")
  local twilight = require("twilight")
  local utils = require("utils")

  zen.setup({
    window = {
      width = 104,
      options = {
        number = false,
        relativenumber = false,
        cursorline = false,
        colorcolumn = "",
      },
    },
    plugins = {
      gitsigns = { enabled = true },
    },
  })

  twilight.setup({})

  utils.map("n", "<leader>z", ":ZenMode<cr>")
  utils.map("n", "<leader>t", ":Twilight<cr>")
end
