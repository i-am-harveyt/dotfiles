vim.g.mapleader = " "

local opts_setup = function()
	local opt = vim.o
	opt.nu = true
	opt.rnu = true
	opt.swapfile = false
	opt.winborder = "rounded"
	opt.clipboard = "unnamedplus"
	opt.cursorline = true
	opt.tabstop = 8
	opt.shiftwidth = 8
	opt.signcolumn = "yes:1"
	opt.writebackup = false
	opt.timeoutlen = 50
	opt.updatetime = 50
	opt.termguicolors = true
	opt.linebreak = false
	opt.wrap = false
	opt.exrc = true -- enable local config
	opt.secure = true -- safe mode
end
opts_setup()

local keymap_set = function(lhs, rhs, desc, mode)
	mode = mode or "n"
	vim.keymap.set(mode, lhs, rhs, { desc = desc })
end

local keymap_basic_setup = function()
	keymap_set("<leader>fs", ":w<CR>", "[F]ile [S]ave")
	keymap_set("<leader>q", ":q<CR>", "[Q]uit")
	keymap_set("<leader>Q", ":q<CR>", "[Q]uit")

	-- basic
	keymap_set("<esc>", ":nohlsearch<CR>", "nohl")
	keymap_set("<leader>Q", ":q!<CR>", "Force [Q]uit")
	keymap_set("<C-l>", "<ESC>", "Esc", "i")

	-- buffer
	keymap_set("<leader>bd", ":bd<CR>", "[B]uffer [D]elete")
	keymap_set("<leader>bn", ":bn<CR>", "[B]uffer [N]ext")
	keymap_set("<leader>bp", ":bp<CR>", "[B]uffer [P]revious")

	-- file
	keymap_set("<leader>fs", ":w<CR>", "[F]ile [S]ave")

	--window
	keymap_set("<leader>wh", "<C-w>h", "Left Window")
	keymap_set("<leader>wj", "<C-w>j", "Down Window")
	keymap_set("<leader>wk", "<C-w>k", "Up Window")
	keymap_set("<leader>wl", "<C-w>l", "Right Window")
	keymap_set("<leader>wq", "<C-w>q", "[W]indow [Q]uit")
	keymap_set("<leader>wsh", "<C-w>s", "[W]indow [S]plit [H]orizontally")
	keymap_set("<leader>wsv", "<C-w>v", "[W]indow [S]plit [V]ertically")

	-- lsp
	keymap_set("K", ":lua vim.lsp.buf.hover()<CR>", "[H]over")
	keymap_set("<leader>h", ":lua vim.lsp.buf.hover()<CR>", "[H]over")
	keymap_set("<leader>la", ":lua vim.lsp.buf.code_action()<CR>", "[L]SP [A]ction")
	keymap_set("<leader>ld", ":lua vim.lsp.buf.definition()<CR>", "[L]SP [D]efinition")
	keymap_set("<leader>lt", ":lua vim.lsp.buf.type_definition()<CR>", "[L]SP [T]ype Definition")
	keymap_set("<leader>lh", ":lua vim.lsp.buf.hover()<CR>", "[L]SP [H]over")
	keymap_set("<leader>lj", ":lua vim.lsp.diagnostic.goto_next()<CR>", "[L]SP Next Diagnostic")
	keymap_set("<leader>lk", ":lua vim.lsp.diagnostic.goto_prev()<CR>", "[L]SP Prev Diagnostic")
	keymap_set("<leader>lr", ":lua vim.lsp.buf.rename()<CR>", "[L]SP [R]ename")
end
keymap_basic_setup()

-- package manager
vim.pack.add({
	{ src = "https://github.com/windwp/nvim-autopairs", name = "autopairs" },
	{ src = "https://github.com/echasnovski/mini.clue.git", name = "mini.clue" },
	{ src = "https://github.com/echasnovski/mini.files.git", name = "mini.files" },
	{ src = "https://github.com/williamboman/mason.nvim.git", name = "mason.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig.git", name = "nvim-lspconfig" },
	{ src = "https://github.com/williamboman/mason-lspconfig.nvim.git", name = "mason-lspconfig.nvim" },
	{ src = "https://github.com/rose-pine/neovim.git", name = "rose-pine" },
	{ src = "https://github.com/folke/tokyonight.nvim.git", name = "tokyonight" },
	{ src = "https://github.com/glepnir/lspsaga.nvim.git", name = "lsp-saga" },
	{ src = "https://github.com/stevearc/conform.nvim", name = "conform-nvim" },
	{ src = "https://github.com/kevinhwang91/promise-async", name = "async" }, --dp: nvim-ufo
	{ src = "https://github.com/kevinhwang91/nvim-ufo", name = "nvim-ufo" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim", name = "gitsigns" }, -- git signs
	{ src = "https://github.com/neanias/everforest-nvim", name = "everforest" },
	{ src = "https://github.com/folke/neoconf.nvim", name = "neoconf.nvim" },
	{ src = "https://github.com/dmtrKovalenko/fff.nvim", name = "fff.nvim" }, -- fff
})
require("nvim-autopairs").setup()
local mini_setup = function()
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
		window = { delay = 300 },
	})
	require("mini.files").setup()
	keymap_set("<leader>e", ":lua MiniFiles.open()<CR>", "[E]xplorer")
end
mini_setup()

local fff_setup = function()
	vim.api.nvim_create_autocmd("PackChanged", {
		callback = function(ev)
			local name, kind = ev.data.spec.name, ev.data.kind
			if name == "fff.nvim" and (kind == "install" or kind == "update") then
				if not ev.data.active then
					vim.cmd.packadd("fff.nvim")
				end
				require("fff.download").download_or_build_binary()
			end
		end,
	})

	vim.g.fff = {
		lazy_sync = true,
		debug = { enabled = true, show_scores = true },
	}

	local fff = require("fff")
	keymap_set("<space>ff", function()
		fff.find_files()
	end, "FFFind files", "n")
	keymap_set("<space>fc", function()
		fff.live_grep()
	end, "FFFind Live Grep", "n")
end
fff_setup()

-- gitsigns
local gitsigns_setup = function()
	require("gitsigns").setup({})
	local gitsigns = require("gitsigns")
	keymap_set("<leader>gb", gitsigns.toggle_current_line_blame, "[G]it [B]lame")
	keymap_set("<leader>gn", function()
		if vim.wo.diff then
			vim.cmd.normal({ "<leader>gn", bang = true })
		else
			gitsigns.nav_hunk("next")
		end
	end, "[N]ext Change")

	keymap_set("<leader>gp", function()
		if vim.wo.diff then
			vim.cmd.normal({ "<leader>gp", bang = true })
		else
			gitsigns.nav_hunk("prev")
		end
	end, "[P]revious Change")
end
gitsigns_setup()

-- colorscheme
-- vim.cmd([[colorscheme rose-pine-moon]])
-- vim.cmd([[colorscheme tokyonight-storm]])
require("everforest").setup({ background = "hard" })
vim.cmd([[colorscheme everforest]])
-- vim.cmd([[colorscheme retrobox]])

-- Auto Complete
local auto_complete_setup = function()
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
end
auto_complete_setup()

-- LSP
local lsp_setup = function()
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
	nvim_lsp.gleam.setup({})
	nvim_lsp.vtsls.setup({
		root_dir = nvim_lsp.util.root_pattern("package.json"),
		single_file_support = false,
	})
	nvim_lsp.zls.setup({
		cmd = { "/Users/tonghaoting/.local/share/mise/installs/zls/0.16/zls" },
		filetypes = { "zig", "zir" },
		root_dir = nvim_lsp.util.root_pattern("build.zig", ".git"),
		settings = {
			enable_build_on_save = true,
			build_on_save_step = "check",
		},
	})

	keymap_set("<leader>lI", ":Mason<CR>", "[L]SP [I]nstaller")
	keymap_set("<leader>li", ":LspInfo<CR>", "[L]SP [I]nfo")
	keymap_set("<leader>ll", ":LspLog<CR>", "[L]SP [L]og")
end
lsp_setup()

-- Conform-nvim
local conform = require("conform")
local util = require("conform.util")
local conform_setup = function()
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
	conform.formatters["clang-format"] = { prepend_args = { "-style", "Microsoft" } }
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
	keymap_set("<leader>lf", function()
		conform.format({
			async = true,
			lsp_format = "fallback",
		})
	end, "Format")
end
conform_setup()

-- LspSaga
require("lspsaga").setup({
	ui = { code_action = "" },
	symbol_in_winbar = {
		-- enable = false,
		color_mode = false,
	},
})
local lsp_saga_keymap = function()
	keymap_set("<leader>ca", ":Lspsaga code_action<CR>", "[C]ode [A]ction")
	keymap_set("<leader>cd", ":Lspsaga peek_definition<CR>", "[C]ode [D]efinition")
	keymap_set("<leader>cf", ":Lspsaga finder ref+def<CR>", "[C]ode [F]inder")
	keymap_set("<leader>ci", ":Lspsaga finder imp<CR>", "[C]ode [I]mplementation")
	keymap_set("<leader>cj", ":Lspsaga diagnostic_jump_next<CR>", "[C]ode [N]ext Diagnostics")
	keymap_set("<leader>ck", ":Lspsaga diagnostic_jump_prev<CR>", "[C]ode [P]rev Diagnostics")
	keymap_set("<leader>co", ":Lspsaga outline<CR>", "[C]ode [O]utline")
	keymap_set("<leader>cr", ":Lspsaga rename<CR>", "[C] [R]ename")
	keymap_set("<leader>dc", ":Lspsaga show_cursor_diagnostics<Cr>", "[D]iagnostic [C]ursor")
	keymap_set("<leader>dl", ":Lspsaga show_line_diagnostics<Cr>", "[D]iagnostic [L]ine")
end
lsp_saga_keymap()

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
