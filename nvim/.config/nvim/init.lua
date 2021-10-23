require("plugins")

local opt = vim.opt
local g = vim.g
local cmd = vim.cmd

-- options
opt.termguicolors = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.ignorecase = true
opt.smartcase = true
opt.number = true
opt.relativenumber = true
opt.hidden = true
opt.wrap = false
opt.swapfile = false
opt.incsearch = true
opt.hlsearch = false
opt.scrolloff = 8
opt.colorcolumn = "100"
opt.signcolumn = "yes"
opt.clipboard = "unnamedplus"
opt.splitbelow = true
opt.splitright = true
opt.guifont = "Fira Code Medium:h11"

cmd([[
  autocmd TermOpen * setlocal nonumber norelativenumber
]])

-- color scheme
g.vscode_style = "dark"
cmd([[ colorscheme vscode ]])

-- mappings
require("mappings")

-- nvim tree
g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "",
    staged = "",
    unmerged = "",
    renamed = "",
    untracked = "",
    deleted = "",
    ignored = "",
  },
  folder = {
    arrow_open = "",
    arrow_closed = "",
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
    symlink_open = "",
  },
}
