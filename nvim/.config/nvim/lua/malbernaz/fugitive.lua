return function()
  vim.cmd([[
    augroup set_fugitive_opts
      autocmd!
      autocmd FileType fugitive call SetFugitiveOpts() 
    augroup END

    function! SetFugitiveOpts()
      setlocal nonumber norelativenumber
      setlocal colorcolumn=""
      setlocal signcolumn=no
    endfunction
  ]])
end
