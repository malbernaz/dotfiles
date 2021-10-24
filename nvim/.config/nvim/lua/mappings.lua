local utils = require("utils")

vim.g.mapleader = " "

-- paste last yanked, not deleted
utils.map("n", "`p", '"0p')
utils.map("n", "`P", '"0P')

-- telescope
utils.map("n", "<c-p>", "<cmd>lua require('telescope.builtin').git_files({ hidden = true })<cr>")
utils.map("n", "<c-g>", "<cmd>lua require('telescope.builtin').live_grep({ hidden = true })<cr>")
utils.map("n", "<c-b>", "<cmd>lua require('telescope.builtin').buffers()<cr>")
utils.map("n", "<c-n>", ":lua require('malbernaz.telescope').file_browser()<cr>")
utils.map("n", "-", ":lua require('malbernaz.telescope').file_browser({ cwd = '%:p:h' })<cr>")

-- splits
utils.map("n", "<C-h>", "<C-w>h")
utils.map("n", "<C-j>", "<C-w>j")
utils.map("n", "<C-k>", "<C-w>k")
utils.map("n", "<C-l>", "<C-w>l")

-- move lines
utils.map("v", "K", ":m '<-2<CR>gv=gv")
utils.map("v", "J", ":m '>+1<CR>gv=gv")

-- modify redo
utils.map("n", "U", "<C-r>")

-- buffers
utils.map("n", "]b", ":bnext<cr>", { silent = true })
utils.map("n", "[b", ":bprev<cr>", { silent = true })

-- universal hjkl
utils.map("i", "<C-h>", "<Left>")
utils.map("i", "<C-j>", "<Down>")
utils.map("i", "<C-k>", "<Up>")
utils.map("i", "<C-l>", "<Right>")
