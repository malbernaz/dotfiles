-- plugins
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
opt.undodir = vim.fn.expand("$HOME") .. "/.config/nvim"
opt.backup = false
opt.undofile = true
opt.incsearch = true
opt.hlsearch = false
opt.scrolloff = 8
opt.colorcolumn = "100"
opt.signcolumn = "yes"
opt.clipboard = "unnamedplus"
opt.splitbelow = true
opt.splitright = true
opt.guifont = "Fira Code Medium:h11"

-- hide numbers on terminal buffers
cmd([[ autocmd TermOpen * setlocal nonumber norelativenumber ]])

-- color scheme
g.vscode_style = "dark"
cmd([[ colorscheme vscode ]])

-- mappings
require("mappings")
