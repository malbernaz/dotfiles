return function()
  local cmp = require("cmp")

  cmp.setup({
    sources = {
      { name = "nvim_lsp" },
      { name = "buffer" },
    },
    mapping = {
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
      ["<TAB>"] = cmp.mapping(
        cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        { "i", "s" }
      ),
      ["<S-TAB>"] = cmp.mapping(
        cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        { "i", "s" }
      ),
    },
  })
end
