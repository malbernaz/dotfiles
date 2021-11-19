local utils = require("utils")

vim.g.mapleader = " "

-- paste last yanked, not deleted
utils.map("n", "`p", '"0p')
utils.map("n", "`P", '"0P')

-- telescope
utils.map("n", "<c-p>", "<cmd>lua require('telescope.builtin').git_files({ hidden = true })<cr>")
utils.map("n", "<c-g>", "<cmd>lua require('telescope.builtin').live_grep({ hidden = true })<cr>")
utils.map("n", "<c-b>", "<cmd>lua require('telescope.builtin').buffers()<cr>")

-- splits
utils.map("n", "<c-h>", "<c-w>h")
utils.map("n", "<c-j>", "<c-w>j")
utils.map("n", "<c-k>", "<c-w>k")
utils.map("n", "<c-l>", "<c-w>l")

-- move lines
utils.map("v", "K", ":m '<-2<cR>gv=gv")
utils.map("v", "J", ":m '>+1<cR>gv=gv")

-- modify redo
utils.map("n", "U", "<c-r>")

-- buffers
utils.map("n", "]b", ":bnext<cr>", { silent = true })
utils.map("n", "[b", ":bprev<cr>", { silent = true })

-- universal hjkl
utils.map("i", "<c-h>", "<Left>")
utils.map("i", "<c-j>", "<Down>")
utils.map("i", "<c-k>", "<Up>")
utils.map("i", "<c-l>", "<Right>")

-- netrw
utils.map("n", "-", ":e %:p:h<cr>")

-- nvimtree
utils.map("n", "<c-n>", ":NvimTreeToggle<cr>")

-- format
utils.map("n", "<leader>f", ":Format<cr>")

-- terminal
utils.map("t", "<c-[>", [[<C-\><C-n>]])
