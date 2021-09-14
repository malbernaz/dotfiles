return function()
  require("indent_blankline").setup({
    filetype_exclude = {
      "vimwiki",
      "man",
      "gitmessengerpopup",
      "diagnosticpopup",
      "lspinfo",
      "packer",
      "TelescopePrompt",
      "TelescopeResults",
      "",
    },
    buftype_exclude = { "terminal" },
  })
end
