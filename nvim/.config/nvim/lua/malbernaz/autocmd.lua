local packer_group = vim.api.nvim_create_augroup("PackerGroup", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  group = packer_group,
  pattern = "plugins.lua",
  command = "source <afile> | PackerCompile",
})

local terminal_group = vim.api.nvim_create_augroup("TerminalGroup", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
  group = terminal_group,
  callback = function()
    vim.wo.number = false
    vim.wo.relativenumber = false
    vim.wo.signcolumn = "no"
    vim.cmd("startinsert")
  end,
})

local txt_group = vim.api.nvim_create_augroup("TxtGroup", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = txt_group,
  pattern = { "gitcommit", "markdown", "markdown.mdx" },
  callback = function()
    vim.wo.wrap = true
    vim.wo.spell = true
  end,
})

local yank_group = vim.api.nvim_create_augroup("YankGroup", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  group = yank_group,
  callback = function()
    vim.highlight.on_yank()
  end,
})

local clear_styles_group = vim.api.nvim_create_augroup("ClearStylesGroup", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = clear_styles_group,
  pattern = { "help", "fugitive", "netrw" },
  callback = function()
    vim.wo.number = false
    vim.wo.relativenumber = false
    vim.wo.signcolumn = "no"
    vim.wo.colorcolumn = ""
  end,
})
