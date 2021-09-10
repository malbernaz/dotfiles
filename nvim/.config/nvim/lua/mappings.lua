local utils = require("utils")

vim.g.mapleader = " "

-- telescope
utils.map("n", "<C-p>", "<cmd>lua require('telescope.builtin').git_files()<cr>")
utils.map("n", "<C-f>", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
utils.map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
utils.map("n", "<leader>gg", "<cmd>lua require('telescope.builtin').buffers()<cr>")

-- completion
utils.map("i", "<Tab>", "pumvisible() ? '<C-n>' : '<Tab>'")
utils.map("i", "<Tab>", 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true })
utils.map("i", "<S-Tab>", 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', { expr = true })

-- splits
utils.map("n", "<C-h>", "<C-w>h")
utils.map("n", "<C-j>", "<C-w>j")
utils.map("n", "<C-k>", "<C-w>k")
utils.map("n", "<C-l>", "<C-w>l")
