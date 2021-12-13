return function()
  vim.cmd([[
    augroup disable_stuff
      autocmd!
      autocmd FileType fugitive call DisableStuff() 
    augroup END

    function! DisableStuff()
      setlocal nonumber norelativenumber
      setlocal colorcolumn=
      setlocal signcolumn=
    endfunction
  ]])
end