local lualine = require("lualine")
local theme = require("monokai.lualine")
local palette = require("monokai.palette")

local config = {
  options = {
    theme = theme,
    component_separators = { left = "│", right = "│" },
    section_separators = { left = " ", right = " " },
    globalstatus = true,
  },
  sections = {
    lualine_b = {
      "branch",
      {
        "diff",
        diff_color = {
          added = { fg = palette.green },
          modified = { fg = palette.orange },
          removed = { fg = palette.pink },
        },
      },
      {
        "diagnostics",
        diagnostics_color = {
          error = { fg = palette.pink },
          warn = { fg = palette.yellow },
          info = { fg = palette.white },
          hint = { fg = palette.aqua },
        },
      },
    },
    lualine_c = { "%f %m" },
    lualine_x = { "filetype" },
  },
}

lualine.setup(config)
