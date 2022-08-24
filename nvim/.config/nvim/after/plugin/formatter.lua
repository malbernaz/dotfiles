local utils = require("malbernaz.utils")

local function prettier()
  local local_prettier = vim.fn.getcwd() .. "/node_modules/.bin/prettier"
  local cmd = vim.fn.filereadable(local_prettier) > 0 and local_prettier or "prettier"

  return {
    exe = cmd,
    args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
    stdin = true,
  }
end

local function stylua()
  return {
    exe = "stylua --search-parent-directories",
    stdin = false,
  }
end

local filetype = {
  lua = { stylua },
}

local prettierFt = {
  "javascript",
  "typescript",
  "typescriptreact",
  "javascriptreact",
  "json",
  "html",
  "css",
  "scss",
  "graphql",
  "markdown",
  "markdown.mdx",
  "vue",
}

for _, ft in ipairs(prettierFt) do
  filetype[ft] = { prettier }
end

require("formatter").setup({ logging = false, filetype = filetype })

-- mappings
utils.map("n", "<leader>f", ":FormatWrite<cr>")

utils.create_cmdgroup({
  name = "FormatGroup",
  event = "BufWritePost",
  pattern = {
    "*.js",
    "*.jsx",
    "*.ts",
    "*.tsx",
    "*.json",
    "*.vue",
    "*.html",
    "*.css",
    "*.scss",
    "*.md",
    "*.mdx",
    "*.graphql",
    "*.gql",
    "*.lua",
  },
  command = "FormatWrite",
})
