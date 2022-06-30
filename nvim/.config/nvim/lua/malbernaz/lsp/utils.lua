local utils = require("malbernaz.utils")
local cmp = require("cmp_nvim_lsp")

local map = utils.map
local buf = vim.lsp.buf
local dgnt = vim.diagnostic

map("n", "<leader>e", dgnt.open_float)
map("n", "[d", dgnt.goto_prev)
map("n", "]d", dgnt.goto_next)
map("n", "<leader>q", dgnt.setloclist)

local M = {}

function M.on_init(client)
	client.config.flags = client.config.flags or {}
	client.config.flags.allow_incremental_sync = true
end

function M.on_attach(_, buffn)
	vim.o.omnifunc = "v:lua:vim.lsp.omnifunc"

	local bufopts = { buffer = buffn }

	map("n", "K", buf.hover, bufopts)
	map("n", "gD", buf.declaration, bufopts)
	map("n", "gd", buf.definition, bufopts)
	map("n", "gi", buf.implementation, bufopts)
	map("n", "gr", buf.references, bufopts)
	map("n", "<C-s>", buf.signature_help, bufopts)
	map("n", "<leader>wa", buf.add_workspace_folder, bufopts)
	map("n", "<leader>wr", buf.remove_workspace_folder, bufopts)
	map("n", "<leader>wl", function()
		print(vim.inspect(buf.list_workspace_folders()))
	end, bufopts)
	map("n", "<leader>D", buf.type_definition, bufopts)
	map("n", "<leader>rn", buf.rename, bufopts)
	map("n", "<leader>ca", buf.code_action, bufopts)
end

M.capabilities = cmp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

function M.makeConfig(config)
	return vim.tbl_deep_extend("force", {
		capabilities = M.capabilities,
		on_init = M.on_init,
		on_attach = M.on_attach,
	}, config or {})
end

return M
