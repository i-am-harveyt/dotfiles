local sources = {}
local config = function()
	local nl = require("null-ls")
	local dgn = nl.builtins.diagnostics
	local fmt = nl.builtins.formatting
	-- local cmp = nl.builtins.completion
	-- nl.setup({
	-- 	sources = {
	-- 		-- cmp.spell,
	-- 		dgn.pylint.with({
	-- 			method = nl.methods.DIAGNOSTICS_ON_SAVE,
	-- 			prefer_local = ".venv/bin",
	-- 		}),
	-- 		fmt.black.with({
	-- 			method = nl.methods.RANGE_FORMATTING
	-- 		}),
	-- 		fmt.isort,
	-- 		fmt.prettier.with({
	-- 			method = nl.methods.RANGE_FORMATTING
	-- 		}),
	-- 		fmt.stylua.with({
	-- 			method = nl.methods.RANGE_FORMATTING
	-- 		}),
	-- 		fmt.goimports,
	-- 		fmt.gofumpt,
	-- 	,
	-- })
end

-- return {
-- 	"nvimtools/none-ls.nvim",
-- 	event = "InsertEnter",
-- 	config = config,
-- }
return {}
