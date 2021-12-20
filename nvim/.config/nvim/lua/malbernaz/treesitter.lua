return function()
  local utils = require("malbernaz.utils")
  local ts = require("nvim-treesitter.configs")

  local list = require("nvim-treesitter.parsers").get_parser_configs()

  list.sql = {
    install_info = {
      url = "https://github.com/DerekStride/tree-sitter-sql",
      files = { "src/parser.c" },
      branch = "main",
    },
  }

  ts.setup({
    highlight = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
    indent = { enable = true },
    matchup = { enable = true },
    autopairs = { enable = true },
    autotag = { enable = true },
    context_commentstring = { enable = true, enable_autocmd = false },
    playground = {
      enable = true,
      updatetime = 25,
      persist_queries = false,
    },
  })

  utils.map("n", "<leader>o", ":TSH<cr>")
  utils.map("n", "<leader>p", ":TSP<cr>")
end
