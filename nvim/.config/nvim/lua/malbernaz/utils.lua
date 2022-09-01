local api = vim.api
local set = vim.keymap.set

local M = {}

function M.map(mode, l, r, opts)
  set(mode, l, r, vim.tbl_extend("force", { noremap = true, silent = true }, opts or {}))
end

function M.nmap(l, r, opts)
  M.map("n", l, r, opts)
end

function M.imap(l, r, opts)
  M.map("i", l, r, opts)
end

function M.vmap(l, r, opts)
  M.map("v", l, r, opts)
end

function M.tmap(l, r, opts)
  M.map("t", l, r, opts)
end

function M.create_cmdgroup(opts)
  api.nvim_create_autocmd(opts.event, {
    group = api.nvim_create_augroup(opts.name, { clear = opts.clear or true }),
    pattern = opts.pattern,
    command = opts.command,
    callback = opts.callback,
  })
end

function M.noop() end

return M
