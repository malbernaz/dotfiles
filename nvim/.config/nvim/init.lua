require("plugins")

local opt = vim.opt
local g = vim.g
local cmd = vim.cmd

-- color scheme
g.vscode_style = "dark"
cmd([[ colorscheme vscode ]])

-- options
opt.termguicolors = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.number = true
opt.relativenumber = true
opt.hidden = true
opt.wrap = false
opt.swapfile = false
opt.incsearch = true
opt.scrolloff = 8
opt.colorcolumn = "100"
opt.signcolumn = "yes:1"
opt.clipboard = "unnamedplus"
opt.splitbelow = true
opt.splitright = true
opt.guifont = "Fira Code:h14:sb"
g.neovide_cursor_animation_length = 0

-- mappings
require("mappings")
