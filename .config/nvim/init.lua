local keymap_set = function(lhs, rhs, desc, mode)
	mode = mode or "n"
	vim.keymap.set(mode, lhs, rhs, { desc = desc })
end

local opt = vim.o
-- opt.nu = true
-- opt.rnu = true
opt.swapfile = false
opt.winborder = "rounded"
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.signcolumn = "yes:1"
opt.writebackup = false
opt.timeoutlen = 50
opt.updatetime = 50
opt.termguicolors = true
opt.linebreak = false
opt.wrap = false
vim.g.mapleader = " "

local keymap_basic_setup = function()
	keymap_set("<leader>fs", ":w<CR>", "[F]ile [S]ave")
	keymap_set("<leader>q", ":q<CR>", "[Q]uit")
	keymap_set("<leader>Q", ":q<CR>", "[Q]uit")

	-- basic
	keymap_set("<esc>", ":nohlsearch<CR>", "nohl")
	keymap_set("<Space>Q", ":q!<CR>", "Force [Q]uit")
	keymap_set("<C-l>", "<ESC>", "Esc", "i")

	-- buffer
	keymap_set("<Space>bd", ":bd<CR>", "[B]uffer [D]elete")
	keymap_set("<Space>bn", ":bn<CR>", "[B]uffer [N]ext")
	keymap_set("<Space>bp", ":bp<CR>", "[B]uffer [P]revious")

	-- file
	keymap_set("<Space>fs", ":w<CR>", "[F]ile [S]ave")

	--window
	keymap_set("<Space>wh", "<C-w>h", "Left Window")
	keymap_set("<Space>wj", "<C-w>j", "Down Window")
	keymap_set("<Space>wk", "<C-w>k", "Up Window")
	keymap_set("<Space>wl", "<C-w>l", "Right Window")
	keymap_set("<Space>wq", "<C-w>q", "[W]indow [Q]uit")
	keymap_set("<Space>wsh", "<C-w>s", "[W]indow [S]plit [H]orizontally")
	keymap_set("<Space>wsv", "<C-w>v", "[W]indow [S]plit [V]ertically")

	-- lsp
	keymap_set("K", ":lua vim.lsp.buf.hover()<CR>", "[H]over")
	keymap_set("<Space>h", ":lua vim.lsp.buf.hover()<CR>", "[H]over")
	keymap_set("<Space>la", ":lua vim.lsp.buf.code_action()<CR>", "[L]SP [A]ction")
	keymap_set("<Space>ld", ":lua vim.lsp.buf.definition()<CR>", "[L]SP [D]efinition")
	keymap_set("<Space>lh", ":lua vim.lsp.buf.hover()<CR>", "[L]SP [H]over")
	keymap_set("<Space>lj", ":lua vim.lsp.diagnostic.goto_next()<CR>", "[L]SP Next Diagnostic")
	keymap_set("<Space>lk", ":lua vim.lsp.diagnostic.goto_prev()<CR>", "[L]SP Prev Diagnostic")
	keymap_set("<Space>lr", ":lua vim.lsp.buf.rename()<CR>", "[L]SP [R]ename")
end
keymap_basic_setup()

-- package manager
vim.pack.add({
	{ src = "https://github.com/windwp/nvim-autopairs", name = "autopairs" },
	{ src = "https://github.com/echasnovski/mini.clue.git", name = "mini.clue" },
	{ src = "https://github.com/echasnovski/mini.files.git", name = "mini.files" },
	{ src = "https://github.com/echasnovski/mini.pick.git", name = "mini.pick" },
	{ src = "https://github.com/williamboman/mason.nvim.git", name = "mason.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig.git", name = "nvim-lspconfig" },
	{ src = "https://github.com/williamboman/mason-lspconfig.nvim.git", name = "mason-lspconfig.nvim" },
	{ src = "https://github.com/rose-pine/neovim.git", name = "rose-pine" },
	{ src = "https://github.com/folke/tokyonight.nvim.git", name = "tokyonight" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter.git", name = "nvim-treesitter" },
	{ src = "https://github.com/glepnir/lspsaga.nvim.git", name = "lsp-saga" },
	{ src = "https://github.com/stevearc/conform.nvim", name = "conform-nvim" },
	{ src = "https://github.com/kevinhwang91/promise-async", name = "async" }, --dp: nvim-ufo
	{ src = "https://github.com/kevinhwang91/nvim-ufo", name = "nvim-ufo" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim", name = "gitsigns" }, -- git signs
	{ src = "https://github.com/neanias/everforest-nvim", name = "everforest" }, -- git signs
})
require("everforest").setup({
	background = "hard",
})
require("nvim-autopairs").setup()
local miniclue = require("mini.clue")
miniclue.setup({
	triggers = {
		-- Leader triggers
		{ mode = "n", keys = "<Leader>" },
		{ mode = "x", keys = "<Leader>" },

		-- Built-in completion
		{ mode = "i", keys = "<C-x>" },

		-- `g` key
		{ mode = "n", keys = "g" },
		{ mode = "x", keys = "g" },

		-- Marks
		{ mode = "n", keys = "'" },
		{ mode = "n", keys = "`" },
		{ mode = "x", keys = "'" },
		{ mode = "x", keys = "`" },

		-- Movement
		{ mode = "n", keys = "[" },
		{ mode = "n", keys = "]" },

		-- Registers
		{ mode = "n", keys = '"' },
		{ mode = "x", keys = '"' },
		{ mode = "i", keys = "<C-r>" },
		{ mode = "c", keys = "<C-r>" },

		-- Window commands
		{ mode = "n", keys = "<C-w>" },

		-- `z` key
		{ mode = "n", keys = "z" },
		{ mode = "x", keys = "z" },
	},
	clues = {
		-- Enhance this by adding descriptions for <Leader> mapping groups
		miniclue.gen_clues.builtin_completion(),
		miniclue.gen_clues.g(),
		miniclue.gen_clues.marks(),
		miniclue.gen_clues.registers(),
		miniclue.gen_clues.windows(),
		miniclue.gen_clues.z(),
	},
	window = {
		delay = 300,
	},
})
require("mini.files").setup()
keymap_set("<Space>e", ":lua MiniFiles.open()<CR>", "[E]xplorer")
require("mini.pick").setup()
keymap_set("<leader>Fw", ":Pick grep_live<CR>", "[F]ile [W]ord")
keymap_set("<leader>Ff", ":Pick files<CR>", "[F]ind [F]iles")
keymap_set("<leader>Fb", ":Pick buffers<CR>", "[F]ind [B]uffers")

-- gitsigns
require("gitsigns").setup({})
local gitsigns = require("gitsigns")
keymap_set("<Space>gb", gitsigns.toggle_current_line_blame, "[G]it [B]lame")
keymap_set("<Space>gn", function()
	if vim.wo.diff then
		vim.cmd.normal({ "<Space>gn", bang = true })
	else
		gitsigns.nav_hunk("next")
	end
end, "[N]ext Change")

keymap_set("<Space>gp", function()
	if vim.wo.diff then
		vim.cmd.normal({ "<Space>gp", bang = true })
	else
		gitsigns.nav_hunk("prev")
	end
end, "[P]revious Change")

-- colorscheme
-- vim.cmd([[colorscheme rose-pine-moon]])
-- vim.cmd([[colorscheme tokyonight-storm]])
vim.cmd([[colorscheme everforest]])

-- treesitter
---@diagnostic disable-next-line: missing-fields
require("nvim-treesitter.configs").setup({
	build = "TSUpdate",
	ensure_installed = { "lua", "markdown" },
	ignore_install = { "org" },
	sync_install = false,
	auto_install = false,
	highlight = {
		enable = true,
		disable = function(_, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
	},
	incremental_selection = { enable = true },
	indent = { enable = true },
})

-- Auto Complete
vim.cmd([[set completeopt=menu,menuone,noinsert,noselect,fuzzy,popup]])
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client == nil then
			error("LSP: client load failed")
			return
		end
		if client:supports_method("textDocument/completion") then
			-- trigger on every keypress
			local chars = {}
			for i = 65, 90 do
				table.insert(chars, string.char(i))
			end
			for i = 97, 122 do
				table.insert(chars, string.char(i))
			end
			table.insert(chars, ".")
			client.server_capabilities.completionProvider.triggerCharacters = chars

			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})
vim.diagnostic.config({
	-- virtual_lines = { current_line = true },
	underline = true,
	severity_sort = true,
	virtual_text = { current_line = true },
})

-- LSP
require("mason").setup()
require("mason-lspconfig").setup({
	automatic_enable = {
		exclude = { "denols", "vtsls" },
	},
})
local nvim_lsp = require("lspconfig")

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})

nvim_lsp.marksman.setup({
	filetypes = { "markdown", "markdown.mdx" },
	single_file_support = true,
})
nvim_lsp.denols.setup({
	root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
	single_file_support = false,
})
nvim_lsp.vtsls.setup({
	root_dir = nvim_lsp.util.root_pattern("package.json"),
	single_file_support = false,
})

keymap_set("<Space>lI", ":Mason<CR>", "[L]SP [I]nstaller")
keymap_set("<Space>li", ":LspInfo<CR>", "[L]SP [I]nfo")
keymap_set("<Space>ll", ":LspLog<CR>", "[L]SP [L]og")

-- Conform-nvim
local conform = require("conform")
local util = require("conform.util")
conform.setup({
	formatters_by_ft = {
		c = { "clang-format" },
		cpp = { "clang-format" },
		lua = { "stylua" },
		python = { "ruff" },
		go = { "gofumpt", "goimports" },
		ocaml = { "ocamlformat" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		markdown = { "prettier" },
		typst = { "prettypst" },
	},
})
conform.formatters["clang-format"] = {
	prepend_args = { "-style", "Microsoft" },
}
conform.formatters["ruff"] = { command = "ruff format" }
conform.formatters["prettier"] = {
	cwd = util.root_file({ "package.json" }),
	require_cwd = true,
}
conform.formatters["denols"] = {
	cwd = util.root_file({ "deno.json", "deno.jsonc" }),
	command = "deno fmt",
	require_cwd = true,
}
keymap_set("<Space>lf", function()
	conform.format({
		async = true,
		lsp_format = "fallback",
	})
end, "Format")

-- LspSaga
require("lspsaga").setup({
	ui = { code_action = "" },
	symbol_in_winbar = {
		-- enable = false,
		color_mode = false,
	},
})
keymap_set("<Space>ca", ":Lspsaga code_action<CR>", "[C]ode [A]ction")
keymap_set("<Space>cd", ":Lspsaga peek_definition<CR>", "[C]ode [D]efinition")
keymap_set("<Space>cf", ":Lspsaga finder ref+def<CR>", "[C]ode [F]inder")
keymap_set("<Space>ci", ":Lspsaga finder imp<CR>", "[C]ode [I]mplementation")
keymap_set("<Space>cj", ":Lspsaga diagnostic_jump_next<CR>", "[C]ode [N]ext Diagnostics")
keymap_set("<Space>ck", ":Lspsaga diagnostic_jump_prev<CR>", "[C]ode [P]rev Diagnostics")
keymap_set("<Space>co", ":Lspsaga outline<CR>", "[C]ode [O]utline")
keymap_set("<Space>cr", ":Lspsaga rename<CR>", "[C] [R]ename")
keymap_set("<Space>dc", ":Lspsaga show_cursor_diagnostics<Cr>", "[D]iagnostic [C]ursor")
keymap_set("<Space>dl", ":Lspsaga show_line_diagnostics<Cr>", "[D]iagnostic [L]ine")

-- nvim-ufo
vim.o.foldcolumn = "0"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

local ufo = require("ufo")
keymap_set("zR", ufo.openAllFolds, "OpenAll")
keymap_set("zM", ufo.closeAllFolds, "CloseAll")
ufo.setup({
	provider_selector = function(bufnr, filetype, buftype)
		return { "treesitter", "indent" }
	end,
})
