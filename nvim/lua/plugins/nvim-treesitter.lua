local config = function()
	require("nvim-treesitter.configs").setup({
		build = "TSUpdate",
		ensure_installed = { "lua" },
		sync_install = false,
		auto_install = true,
		highlight = { enable = false },
		incremental_selection = { enable = true },
		indent = { enable = true },
	})
end

-- return {
-- 	"nvim-treesitter/nvim-treesitter",
-- 	event = "BufRead",
-- 	config = config,
-- }
return {}
