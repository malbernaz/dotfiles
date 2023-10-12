-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Paste last yanked, not deleted
vim.keymap.set("n", "`p", '"0p', { silent = true })
vim.keymap.set("n", "`P", '"0P', { silent = true })
vim.keymap.set("v", "P", '"_dP', { silent = true })

-- Move lines on visual mode
vim.keymap.set("v", "<s-j>", ":m '>+1<cr>gv=gv", { silent = true })
vim.keymap.set("v", "<s-k>", ":m '<-2<cr>gv=gv", { silent = true })

-- GIT
vim.keymap.set("n", "<leader>gg", function()
  require("neogit").open({ kind = "split" })
end, { desc = "Neogit" })

vim.keymap.set("n", "<leader>gG", function()
  require("neogit").open()
end, { desc = "Neogit (tab)" })
