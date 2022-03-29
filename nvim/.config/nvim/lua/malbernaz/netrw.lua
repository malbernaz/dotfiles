local utils = require("malbernaz.utils")

vim.g.netrw_banner = 0
vim.g.netrw_localcopycmd = "cp -R"
vim.g.netrw_localmkdir = "mkdir -p"

utils.map("n", "-", ":e %:p:h<cr>")

-- remap c-r in netrw
local netrw_group = vim.api.nvim_create_augroup("NetrwGroup", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = netrw_group,
  pattern = "netrw",
  callback = function()
    local buf = vim.fn.expand("<abuf>")
    utils.map_buf(buf, "n", "<c-r>", "<c-l>")
    utils.map_buf(buf, "n", "<c-l>", "<c-w>l")
  end,
})
