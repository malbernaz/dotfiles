local winbar = require("winbar")
local palette = require("monokai.palette")

winbar.setup({
  enabled = true,

  show_file_path = true,
  show_symbols = true,

  colors = {
    path = palette.base7,
    file_name = palette.white,
    symbols = palette.purple,
  },

  icons = {
    file_icon_default = "",
    seperator = ">",
    editor_state = "●",
    lock_icon = "",
  },

  exclude_filetype = {
    "help",
    "packer",
    "Trouble",
    "alpha",
    "toggleterm",
    "neo-tree",
    "terminal",
    "NeogitStatus",
    "NeogitPopup",
    "NeogitCommitMessage",
    "netrw",
    "gitcommit",
    "",
  },
})
