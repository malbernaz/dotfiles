return function()
  local utils = require("malbernaz.utils")
  local ts = require("nvim-treesitter.configs")

  local ftp = require("nvim-treesitter.parsers").filetype_to_parsername

  ftp.javascript = "typescript"
  ftp.javascriptreact = "tsx"

  ts.setup({
    highlight = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "gnn",
        node_decremental = "gmm",
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
