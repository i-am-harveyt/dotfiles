local set = vim.keymap.set

-- basic
set("n", "<esc>", "<CMD>nohlsearch<CR>", { desc = "nohl" })
set("n", "<Space>Q", "<Cmd>q!<CR>", { desc = "Force [Q]uit" })
set("i", "<C-l>", "<ESC>")

-- buffer
set("n", "<Space>bd", "<Cmd>bd<CR>", { desc = "[B]uffer [D]elete" })
set("n", "<Space>bn", "<Cmd>bn<CR>", { desc = "[B]uffer [N]ext" })
set("n", "<Space>bp", "<Cmd>bp<CR>", { desc = "[B]uffer [P]revious" })

-- file
set("n", "<Space>fs", "<Cmd>w<CR>", { desc = "[F]ile [S]ave" })

--window
set("n", "<Space>wh", "<C-w>h", { desc = "Left Window" })
set("n", "<Space>wj", "<C-w>j", { desc = "Down Window" })
set("n", "<Space>wk", "<C-w>k", { desc = "Up Window" })
set("n", "<Space>wl", "<C-w>l", { desc = "Right Window" })
set("n", "<Space>wq", "<C-w>q", { desc = "[W]indow [Q]uit" })
set("n", "<Space>wsh", "<C-w>s", { desc = "[W]indow [S]plit [H]orizontally" })
set("n", "<Space>wsv", "<C-w>v", { desc = "[W]indow [S]plit [V]ertically" })

-- lsp
set("n", "<C-k>", "<CMD>lua vim.lsp.buf.hover()<CR>", { desc = "[H]over" })
set("n", "<Space>h", "<CMD>lua vim.lsp.buf.hover()<CR>", { desc = "[H]over" })
set("n", "<Space>la", "<CMD>lua vim.lsp.buf.code_action()<CR>", { desc = "[L]SP [A]ction" })
set("n", "<Space>ld", "<CMD>lua vim.lsp.buf.definition()<CR>", { desc = "[L]SP [D]efinition" })
set("n", "<Space>lh", "<CMD>lua vim.lsp.buf.hover()<CR>", { desc = "[L]SP [H]over" })
set("n", "<Space>lj", "<CMD>lua vim.lsp.diagnostic.goto_next()<CR>", { desc = "[L]SP Next Diagnostic" })
set("n", "<Space>lk", "<CMD>lua vim.lsp.diagnostic.goto_prev()<CR>", { desc = "[L]SP Prev Diagnostic" })
set("n", "<Space>lr", "<CMD>lua vim.lsp.buf.rename()<CR>", { desc = "[L]SP [R]ename" })
