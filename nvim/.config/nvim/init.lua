require("plugins")

local opt = vim.opt

-- color scheme
vim.g.vscode_style = "dark"
vim.cmd([[ colorscheme vscode ]])

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

-- mappings
require("mappings")
