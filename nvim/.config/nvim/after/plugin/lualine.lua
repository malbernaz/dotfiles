-- local theme = require("monokai.lualine")

require("lualine").setup({
  options = {
    theme = "tokyonight",
    component_separators = { left = "│", right = "│" },
    section_separators = { left = " ", right = " " },
    globalstatus = true,
  },
  sections = {
    lualine_b = {
      "branch",
      { "diff" },
      { "diagnostics" },
    },
    lualine_x = { "filetype" },
  },
})
