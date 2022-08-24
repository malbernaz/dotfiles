local map = require("malbernaz.utils").map

require("trouble").setup({})

map("n", "<leader>xx", ":TroubleToggle<cr>")
