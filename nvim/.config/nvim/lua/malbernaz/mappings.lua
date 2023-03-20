local utils = require("malbernaz.utils")

local nmap = utils.nmap
local imap = utils.imap
local vmap = utils.vmap
local tmap = utils.tmap

vim.g.mapleader = " "

-- Normal mode

-- paste last yanked, not deleted
nmap("`p", '"0p')
nmap("`P", '"0P')

-- splits
nmap("<c-h>", "<c-w>h")
nmap("<c-j>", "<c-w>j")
nmap("<c-k>", "<c-w>k")
nmap("<c-l>", "<c-w>l")

-- resize splits
nmap("<c-up>", ":resize -2<cr>")
nmap("<c-down>", ":resize +2<cr>")
nmap("<c-left>", ":vertical resize -2<cr>")
nmap("<c-right>", ":vertical resize +2<cr>")
nmap("<leader>\\", "<c-w>|")
nmap("<leader>=", "<c-w>=")

-- spell
nmap("<leader>sp", ":set spell!<cr>")

-- diagnostics
nmap("<leader>e", vim.diagnostic.open_float)
nmap("[d", vim.diagnostic.goto_prev)
nmap("]d", vim.diagnostic.goto_next)
nmap("<leader>q", vim.diagnostic.setloclist)

-- Insert mode

-- universal hjkl
imap("<c-h>", "<Left>")
imap("<c-j>", "<Down>")
imap("<c-k>", "<Up>")
imap("<c-l>", "<Right>")

-- Visual mode

-- paste last yanked instead on selection
vmap("p", '"_dP')

-- move lines
vmap("<s-k>", ":m '<-2<cr>gv=gv")
vmap("<s-j>", ":m '>+1<cr>gv=gv")

-- stay in indent mode
vmap("<", "<gv")
vmap(">", ">gv")

-- search for selected text
vmap("//", [[y/\v<c-r>=escape(@",'/\')<cr><cr>]])

-- Terminal mode

-- terminal escape
tmap("<c-p>", "<C-\\><C-n>")
