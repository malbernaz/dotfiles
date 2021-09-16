local utils = require("utils")

vim.g.mapleader = " "

-- for convenience
utils.map("n", ";", ":")

-- paste last yanked, not deleted
utils.map("n", "`p", '"0p')
utils.map("n", "`P", '"0P')

-- telescope
utils.map("n", "<C-p>", "<cmd>lua require('telescope.builtin').git_files()<cr>")
utils.map("n", "<C-f>", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
utils.map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
utils.map("n", "<leader>gg", "<cmd>lua require('telescope.builtin').buffers()<cr>")

-- splits
utils.map("n", "<C-h>", "<C-w>h")
utils.map("n", "<C-j>", "<C-w>j")
utils.map("n", "<C-k>", "<C-w>k")
utils.map("n", "<C-l>", "<C-w>l")
