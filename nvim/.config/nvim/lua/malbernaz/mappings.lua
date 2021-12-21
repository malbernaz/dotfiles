local map = require("malbernaz.utils").map

vim.g.mapleader = " "

-- Normal mode

-- paste last yanked, not deleted
map("n", "`p", '"0p')
map("n", "`P", '"0P')

-- splits
map("n", "<c-h>", "<c-w>h")
map("n", "<c-j>", "<c-w>j")
map("n", "<c-k>", "<c-w>k")
map("n", "<c-l>", "<c-w>l")

-- resize splits
map("n", "<c-up>", ":resize -2<cr>")
map("n", "<c-down>", ":resize +2<cr>")
map("n", "<c-left>", ":vertical resize -2<cr>")
map("n", "<c-right>", ":vertical resize +2<cr>")
map("n", "<leader>\\", "<c-w>|")
map("n", "<leader>=", "<c-w>=")

-- spell
map("n", "<leader>sp", ":set spell!<cr>")

-- go to nvim/config
map("n", "<leader>c", ":cd" .. vim.fn.stdpath("config") .. "<cr>")

-- Insert mode

-- universal hjkl
map("i", "<c-h>", "<Left>")
map("i", "<c-j>", "<Down>")
map("i", "<c-k>", "<Up>")
map("i", "<c-l>", "<Right>")

-- Visual mode

-- paste last yanked instead on selection
map("v", "p", '"_dP')

-- move lines
map("v", "<s-k>", ":m '<-2<cr>gv=gv")
map("v", "<s-j>", ":m '>+1<cr>gv=gv")

-- stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Termianl mode

-- terminal escape
map("t", "<c-p>", "<C-\\><C-n>")
