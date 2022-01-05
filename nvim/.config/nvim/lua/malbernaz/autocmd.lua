vim.cmd([[
  augroup neovim_terminal
    autocmd!
    autocmd TermOpen * call ResetTerminal()
  augroup END

  function! ResetTerminal()
    setlocal nonumber norelativenumber
    setlocal signcolumn=no
    startinsert
  endfunction

  augroup text_buffers
    autocmd!
    autocmd FileType gitcommit,markdown,markdown.mdx setlocal wrap spell
  augroup end

  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])
