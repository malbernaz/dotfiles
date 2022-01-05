return function()
  local lualine = require("lualine")
  local theme = require("monokai.lualine")

  lualine.setup({
    options = {
      theme = theme,
      component_separators = { left = "│", right = "│" },
      section_separators = { left = " ", right = " " },
      disabled_filetypes = { "Yanil" },
    },
    sections = {
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_x = { "filetype" },
    },
  })
end
