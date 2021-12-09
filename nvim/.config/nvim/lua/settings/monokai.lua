return function()
  local monokai = require("monokai")
  local palette = monokai.pro

  local config = {
    palette = palette,
    custom_hlgroups = {
      -- vim
      CursorLineNR = { fg = palette.white },
      Pmenu = { fg = palette.white, bg = palette.base3 },
      PmenuSel = { fg = palette.white, bg = palette.base5 },
      PmenuSelBold = { fg = palette.white, bg = palette.base5 },
      PmenuThumb = { bg = palette.white },
      PmenuSbar = { bg = palette.base3 },
      MatchParen = { fg = palette.white },

      -- Treesitter
      TSConstant = { fg = palette.purple },
      TSConstructor = { fg = palette.aqua },
      TSError = { fg = palette.red },
      TSNamespace = { fg = palette.aqua },
      TSParameter = { fg = palette.orange },
      TSPunctBracket = { fg = palette.base6 },
      TSPunctDelimiter = { fg = palette.base6 },
      TSPunctSpecial = { fg = palette.base6 },
      TSTagDelimiter = { fg = palette.base6 },
      TSTypeBuiltin = { fg = palette.purple },
      TSVariableBuiltin = { fg = palette.white },

      -- plugins
      GitSignsAdd = { fg = palette.green, bg = palette.base2 },
      GitSignsDelete = { fg = palette.pink, bg = palette.base2 },
      GitSignsChange = { fg = palette.orange, bg = palette.base2 },
      CmpItemMenu = { fg = palette.green },
      CmpItemAbbrMatch = { fg = palette.base7 },
      TelescopeTitle = { fg = palette.yellow },
      TelescopeBorder = { fg = palette.base7 },
      TelescopePromptBorder = { fg = palette.base7 },
      TelescopeMatching = { fg = palette.red },
      netrwDir = { fg = palette.orange },
      netrwClassify = { fg = palette.white },
    },
  }

  local kinds = {
    "Text",
    "Method",
    "Function",
    "Constructor",
    "Field",
    "Variable",
    "Class",
    "Interface",
    "Module",
    "Property",
    "Unit",
    "Value",
    "Enum",
    "Keyword",
    "Snippet",
    "Color",
    "File",
    "Reference",
    "Folder",
    "EnumMember",
    "Constant",
    "Struct",
    "Event",
    "Operator",
    "TypeParameter",
  }

  for _, kind in ipairs(kinds) do
    config.custom_hlgroups["CmpItemKind" .. kind] = { fg = palette.orange }
  end

  monokai.setup(config)
end
