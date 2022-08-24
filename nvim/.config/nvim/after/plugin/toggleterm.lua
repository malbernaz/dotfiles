local term = require("toggleterm")

term.setup({
  direction = "float",
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = false,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  size = 20,
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = { border = "curved" },
  highlights = {
    FloatBorder = {
      guifg = "#6c7689",
    },
  },
})
