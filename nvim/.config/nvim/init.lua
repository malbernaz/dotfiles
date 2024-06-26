local pipepath = vim.fn.stdpath("cache") .. "/godot.pipe"

if not vim.loop.fs_stat(pipepath) then
  vim.fn.serverstart(pipepath)
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
