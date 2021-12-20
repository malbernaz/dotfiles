local map = require("malbernaz.utils").map

vim.g.netrw_banner = 0
vim.g.netrw_localcopycmd = "cp -R"
vim.g.netrw_localmkdir = "mkdir -p"

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
