local theme = require("monokai.lualine")

require("lualine").setup({
  options = {
    theme = theme,
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
    lualine_c = { "%f %m" },
    lualine_x = { "filetype" },
  },
})
