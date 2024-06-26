-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.mouse = ""
vim.opt.swapfile = false
vim.opt.relativenumber = false
vim.g.root_spec = { "cwd" }
vim.treesitter.language.register("bash", "zsh")
