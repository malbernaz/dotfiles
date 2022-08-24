require("neogit").setup({ kind = "split" })

vim.cmd([[:command! Git :Neogit]])
vim.cmd([[:command! G :Neogit]])
