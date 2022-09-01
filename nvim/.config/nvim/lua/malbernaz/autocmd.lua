local create_cmdgroup = require("malbernaz.utils").create_cmdgroup

create_cmdgroup({
  name = "PackerGroup",
  event = "BufWritePost",
  pattern = "plugins.lua",
  command = "source <afile> | PackerCompile",
})

create_cmdgroup({
  name = "TerminalGroup",
  event = "TermOpen",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
    vim.opt_local.colorcolumn = ""
    vim.cmd("startinsert")
  end,
})

create_cmdgroup({
  name = "TextGroup",
  event = "FileType",
  pattern = { "gitcommit", "markdown", "markdown.mdx" },
  callback = function()
    vim.opt_local.wrap = true
  end,
})

create_cmdgroup({
  name = "YankGroup",
  event = "TextYankPost",
  callback = function()
    vim.highlight.on_yank()
  end,
})

create_cmdgroup({
  name = "ClearStylesGroup",
  event = "FileType",
  pattern = { "help", "netrw" },
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
    vim.opt_local.colorcolumn = ""
  end,
})
