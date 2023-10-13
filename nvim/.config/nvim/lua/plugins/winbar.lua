local colors = require("tokyonight.colors").default

return {
  "fgheng/winbar.nvim",

  event = "LazyFile",

  opts = {
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
      "term",
      "neo-tree",
      "terminal",
      "lazyterm",
      "NeogitStatus",
      "NeogitPopup",
      "NeogitCommitMessage",
      "netrw",
      "gitcommit",
      "",
    },
  },
}
