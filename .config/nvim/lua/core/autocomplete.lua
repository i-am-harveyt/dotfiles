-- Setup Native Autocomplete
-- vim.o.completeopt = "menu,noinsert,popup,fuzzy"
-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	callback = function(ev)
-- 		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
-- 		-- client.server_capabilities.completionProvider.triggerCharacters =
-- 		-- 	vim.split("qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM.<{[( ", "")
-- 		vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
-- 	end,
-- })
-- -- stop autocompletetion, which is very annoying
-- vim.cmd([[set completeopt+=noselect]])

-- diagnostics
vim.diagnostic.config({
	virtual_lines = { current_line = true },
	-- virtual_text = { current_line = true },
})
