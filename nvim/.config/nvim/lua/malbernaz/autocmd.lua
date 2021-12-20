vim.cmd([[
  augroup neovim_terminal
    autocmd!
    autocmd TermOpen * call ResetTerminal()
  augroup END

  function! ResetTerminal()
    setlocal nonumber norelativenumber
    setlocal signcolumn="no"
    startinsert
  endfunction
]])
