require("lualine").setup({
  options = {
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
