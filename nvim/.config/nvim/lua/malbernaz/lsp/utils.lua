local utils = require("malbernaz.utils")
local cmp = require("cmp_nvim_lsp")

local lsp = vim.lsp
local map = utils.map
local set = utils.set

local M = {}

function M.on_init(client)
	client.config.flags = client.config.flags or {}
	client.config.flags.allow_incremental_sync = true
end

function M.on_attach()
	set("omnifunc", "v:lua:vim.lsp.omnifunc")

	map("n", "K", vim.lsp.buf.hover)
	map("n", "gD", vim.lsp.buf.declaration)
	map("n", "gd", vim.lsp.buf.definition)
	map("n", "gi", vim.lsp.buf.implementation)
	map("n", "gr", vim.lsp.buf.references)
	map("n", "<C-s>", vim.lsp.buf.signature_help)
	map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder)
	map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder)
	map("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end)
	map("n", "<leader>D", vim.lsp.buf.type_definition)
	map("n", "<leader>rn", vim.lsp.buf.rename)
	map("n", "<leader>ca", vim.lsp.buf.code_action)
	map("n", "<leader>e", vim.diagnostic.open_float)
	map("n", "[d", vim.diagnostic.goto_prev)
	map("n", "]d", vim.diagnostic.goto_next)
	map("n", "<leader>q", vim.diagnostic.setloclist)
end

M.capabilities = cmp.update_capabilities(lsp.protocol.make_client_capabilities())

function M.makeConfig(config)
	return vim.tbl_deep_extend("force", {
		capabilities = M.capabilities,
		on_init = M.on_init,
		on_attach = M.on_attach,
	}, config or {})
end

return M
