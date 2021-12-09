local map = require("utils").map

vim.g.mapleader = " "

-- paste last yanked, not deleted
map("n", "`p", '"0p')
map("n", "`P", '"0P')

-- move lines
map("v", "K", ":m '<-2<cR>gv=gv")
map("v", "J", ":m '>+1<cR>gv=gv")

-- splits
map("n", "<c-h>", "<c-w>h")
map("n", "<c-j>", "<c-w>j")
map("n", "<c-k>", "<c-w>k")
map("n", "<c-l>", "<c-w>l")

-- resize splits
map("n", "<leader>s", ":resize +5<cr>")
map("n", "<leader>v", ":vertical resize +5<cr>")
map("n", "<leader>\\", "<c-w>|")
map("n", "<leader>=", "<c-w>=")

-- universal hjkl
map("i", "<c-h>", "<Left>")
map("i", "<c-j>", "<Down>")
map("i", "<c-k>", "<Up>")
map("i", "<c-l>", "<Right>")

-- netrw
map("n", "-", ":e %:p:h<cr>")
vim.cmd([[
augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
  noremap <buffer> <c-r> <c-l>
  noremap <buffer> <c-l> <c-w>l
endfunction
]])

-- terminal
map("t", "<c-p>", "<C-\\><C-n>")

-- spell
map("n", "<leader>sp", ":set spell!<cr>")
