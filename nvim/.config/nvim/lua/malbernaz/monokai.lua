return function()
  local monokai = require("monokai")

  monokai.setup({
    custom_hlgroups = {
      DiffAdd = {
        bg = "#385214",
      },
      DiffChange = {
        bg = "#664e00",
      },
      DiffDelete = {
        bg = "#64021c",
      },
    },
  })
end
