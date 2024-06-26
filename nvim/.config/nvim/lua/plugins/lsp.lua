return {
  {
    "nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
      },
      inlay_hints = {
        enabled = false,
      },
      setup = {
        gdscript = function()
          local lspconfig = require("lspconfig")
          lspconfig.gdscript.setup({})

          return true
        end,
      },
    },
  },
}
