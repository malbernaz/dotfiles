return function()
  require("indent_blankline").setup({
    char = "│",
    show_first_indent_level = true,
    filetype_exclude = {
      "Yanil",
      "Alpha",
      "log",
      "fugitive",
      "gitcommit",
      "packer",
      "vimwiki",
      "markdown",
      "txt",
      "help",
      "NvimTree",
      "git",
      "TelescopePrompt",
      "undotree",
      "flutterToolsOutline",
      "norg",
      "org",
      "orgagenda",
      "", -- for all buffers without a file type
    },
    buftype_exclude = { "terminal", "nofile" },
  })
end
