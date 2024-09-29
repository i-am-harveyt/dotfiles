local opt = vim.opt
local cmd = vim.cmd
local api = vim.api

cmd("colorscheme sorbet")

opt.background = "dark"
opt.backup = false
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.encoding = "utf-8"
opt.guifont = "*"
opt.laststatus = 0 -- remove status line
opt.mouse = "a"
opt.nu = true
opt.rnu = true
opt.smarttab = true
opt.showcmd = true
opt.smartindent = true
opt.shiftwidth = 4
opt.signcolumn = "yes:1"
opt.swapfile = true
opt.timeoutlen = 50
opt.tabstop = 4
opt.termguicolors = true
opt.updatetime = 50
opt.wrap = false
opt.writebackup = false
opt.timeout = true
opt.timeoutlen = 300

vim.keymap.set("i", "<c-l>", "<ESC>")

-- Customization for Pmenu
api.nvim_set_hl(0, "PmenuSel", { bg = "#282C34", fg = "NONE" })
api.nvim_set_hl(0, "Pmenu", { fg = "#C5CDD9", bg = "#22252A" })

return {}
