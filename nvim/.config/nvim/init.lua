-- plugins
require("plugins")

local opt = vim.opt
local g = vim.g

-- options
opt.termguicolors = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.cursorlineopt = "number"
opt.wrap = false
opt.swapfile = false
opt.undodir = vim.fn.expand("$HOME") .. "/.vim/undodir"
opt.undolevels = 100
opt.undofile = true
opt.scrolloff = 8
opt.colorcolumn = "100"
opt.signcolumn = "yes:1"
opt.clipboard = "unnamedplus"
opt.splitbelow = true
opt.splitright = true
opt.mouse = "a"

-- netrw
g.netrw_banner = 0
g.netrw_localcopycmd = "cp -R"
g.netrw_localmkdir = "mkdir -p"

-- disable options in terminal
vim.cmd([[
  augroup neovim_terminal
    autocmd!
    autocmd TermOpen * call ResetTerminal()
  augroup END

  function! ResetTerminal()
    setlocal nonumber norelativenumber
    setlocal signcolumn="no"
    startinsert
  endfunction
]])

-- mappings
require("mappings")
