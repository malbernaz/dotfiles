return function()
  local alpha = require("alpha")
  local db = require("alpha.themes.dashboard")
  local fortune = require("alpha.fortune")

  db.section.buttons.val = {
    db.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
    db.button("f", "  > Find file", ":cd $HOME/Developer | Telescope find_files<CR>"),
    db.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
    db.button("s", "  > Settings", ":e $HOME/.config/nvim | :cd %:p:h<CR>"),
    db.button("q", "  > Quit NVIM", ":qa<CR>"),
  }

  db.section.footer.val = fortune()

  alpha.setup(db.opts)

  vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
end