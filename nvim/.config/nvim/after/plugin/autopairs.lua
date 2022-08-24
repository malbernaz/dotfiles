local npairs = require("nvim-autopairs")

npairs.setup({
  check_ts = true,
  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" },
  },
  disable_filetype = { "TelescopePrompt" },
})
