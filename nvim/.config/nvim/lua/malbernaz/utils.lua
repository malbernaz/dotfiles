local api = vim.api
local set = vim.keymap.set

local M = {}

function M.map(mode, l, r, opts)
	local options = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
	set(mode, l, r, options)
end

function M.map_buf(buf, mode, l, r, opts)
	local options = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
	api.nvim_buf_set_keymap(buf, mode, l, r, options)
end

function M.set(k, v)
	api.nvim_set_option(k, v)
end

function M.create_cmdgroup(opts)
	local group = api.nvim_create_augroup(opts.name, { clear = opts.clear or true })
	api.nvim_create_autocmd(opts.event, {
		group = group,
		pattern = opts.pattern,
		command = opts.command,
		callback = opts.callback,
	})
end

function M.noop() end

return M
