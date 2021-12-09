local utils = require("utils")

vim.g.mapleader = " "

-- paste last yanked, not deleted
utils.map("n", "`p", '"0p')
utils.map("n", "`P", '"0P')

-- splits
utils.map("n", "<c-h>", "<c-w>h")
utils.map("n", "<c-j>", "<c-w>j")
utils.map("n", "<c-k>", "<c-w>k")
utils.map("n", "<c-l>", "<c-w>l")

-- resize splits
utils.map("n", "<leader>s", ":resize +5<cr>")
utils.map("n", "<leader>v", ":vertical resize +5<cr>")
utils.map("n", "<leader>\\", "<c-w>|")
utils.map("n", "<leader>=", "<c-w>=")

-- move lines
utils.map("v", "K", ":m '<-2<cR>gv=gv")
utils.map("v", "J", ":m '>+1<cR>gv=gv")

-- universal hjkl
utils.map("i", "<c-h>", "<Left>")
utils.map("i", "<c-j>", "<Down>")
utils.map("i", "<c-k>", "<Up>")
utils.map("i", "<c-l>", "<Right>")

-- netrw
utils.map("n", "-", ":e %:p:h<cr>")

-- format
utils.map("n", "<leader>f", ":Format<cr>")

-- terminal
utils.map("t", "<c-p>", "<C-\\><C-n>")

-- spell
utils.map("n", "<leader>sp", ":setlocal spell!<cr>")
