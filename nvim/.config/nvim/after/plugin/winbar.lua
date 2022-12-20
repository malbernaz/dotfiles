local winbar = require("winbar")
local colors = require("tokyonight.colors").default

winbar.setup({
  enabled = true,

  show_file_path = true,
  show_symbols = true,

  colors = {
    path = colors.comment,
    file_name = colors.fg,
    symbols = colors.purple,
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
