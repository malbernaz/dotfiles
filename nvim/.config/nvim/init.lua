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

-- netrw
g.loaded_netrw = 0
-- g.netrw_winsize = 20
-- g.netrw_banner = 0
-- g.netrw_liststyle = 3
-- g.netrw_browse_split = 4

-- color scheme
g.vscode_style = "dark"
cmd([[ colorscheme vscode ]])

-- mappings
require("mappings")
