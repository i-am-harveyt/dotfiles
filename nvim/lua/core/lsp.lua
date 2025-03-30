-- set config applies to all LSPs
vim.lsp.config("*", {
	capabilities = {
		textDocument = {
			semanticTokens = {
				multilineTokenSupport = true,
			},
		},
	},
})
-- enable the LSPs
vim.lsp.enable({ "lua_ls", "tls" })

-- Setup Native Autocomplete
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client == nil then
			return
		end
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})
-- stop autocompletetion, which is very annoying
vim.cmd([[set completeopt+=noselect]])

-- diagnostics
vim.diagnostic.config({
	virtual_lines = true,
	-- virtual_text = { current_line = true },
})
