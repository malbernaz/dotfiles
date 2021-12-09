return function()
  local lspkind = require("lspkind")

  lspkind.init()

  local cmp = require("cmp")

  -- general settings
  vim.api.nvim_set_option("completeopt", "menu,menuone,noselect")
  vim.o.shortmess = vim.o.shortmess .. "c"
  vim.g.completion_matching_strategy_list = { "exact", "substring", "fuzzy" }
  vim.g.completion_trigger_keyword_length = 3

  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0
      and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s")
        == nil
  end

  local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
  end

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
      ["<c-space>"] = cmp.mapping.complete(),
      ["<c-e>"] = cmp.mapping.close(),
      ["<cr>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
      ["<tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item({ preselect = true })
        elseif vim.fn["vsnip#available"]() == 1 then
          feedkey("<Plug>(vsnip-expand-or-jump)", "")
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
      ["<s-tab>"] = cmp.mapping(function()
        if cmp.visible() then
          cmp.select_prev_item()
        elseif vim.fn["vsnip#jumpable"](-1) == 1 then
          feedkey("<Plug>(vsnip-jump-prev)", "")
        end
      end, {
        "i",
        "s",
      }),
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "vsnip" },
      { name = "buffer" },
      { name = "path" },
      { name = "spell" },
    },
    formatting = {
      format = lspkind.cmp_format({
        with_text = true,
        menu = {
          buffer = "[buf]",
          nvim_lsp = "[LSP]",
          nvim_lua = "[api]",
          path = "[path]",
          vsnip = "[snip]",
          spell = "[spell]",
        },
      }),
    },
    experimental = {
      ghost_text = true,
    },
  })
end
