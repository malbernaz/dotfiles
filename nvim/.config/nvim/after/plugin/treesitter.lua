local utils = require("malbernaz.utils")
local ts = require("nvim-treesitter.configs")

local langs = {
  javascript = "tsx",
  javascriptreact = "tsx",
  svg = "html",
}

for k, v in pairs(langs) do
  vim.treesitter.language.register(k, v)
end

ts.setup({
  ensure_installed = {
    "fish",
    "sql",
    "bash",
    "lua",
    "vim",
    "typescript",
    "tsx",
    "jsdoc",
    "json",
    "yaml",
    "toml",
    "css",
    "scss",
    "html",
    "graphql",
    "prisma",
    "markdown",
    "svelte",
    "vue",
    "rust",
    "go",
    "php",
    "python",
    "ruby",
    "scheme",
    "dockerfile",
  },
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
