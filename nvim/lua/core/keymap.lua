local set = vim.keymap.set

-- basic
set("n", "<esc>", "<CMD>nohlsearch<CR>", { desc = "nohl" })
set("n", "<Space>Q", "<Cmd>q!<CR>", { desc = "Quit" })

-- buffer
set("n", "<Space>bd", "<Cmd>bd<CR>", { desc = "Delete" })
set("n", "<Space>bn", "<Cmd>bn<CR>", { desc = "Next" })
set("n", "<Space>bp", "<Cmd>bp<CR>", { desc = "Previous" })

-- file
set("n", "<Space>fs", "<Cmd>w<CR>", { desc = "Save" })

--window
set("n", "<Space>wh", "<C-w>h", { desc = "Move left" })
set("n", "<Space>wj", "<C-w>j", { desc = "Move down" })
set("n", "<Space>wk", "<C-w>k", { desc = "Move up" })
set("n", "<Space>wl", "<C-w>l", { desc = "Move right" })
set("n", "<Space>wsh", "<Cmd>split<CR>", { desc = "horizontally" })
set("n", "<Space>wsv", "<Cmd>vsplit<CR>", { desc = "vertically" })

-- lsp
set("n", "<Space>la", "<CMD>lua vim.lsp.buf.code_action()<CR>", { desc = "Code Action" })
set("n", "<Space>ld", "<CMD>lua vim.lsp.buf.definition()<CR>", { desc = "Definition" })
set("n", "<Space>lh", "<CMD>lua vim.lsp.buf.hover()<CR>", { desc = "hover" })
set("n", "<Space>lj", "<CMD>lua vim.lsp.diagnostic.goto_next()<CR>", { desc = "Next Diagnostic" })
set("n", "<Space>lk", "<CMD>lua vim.lsp.diagnostic.goto_prev()<CR>", { desc = "Prev Diagnostic" })
set("n", "<Space>ll", "<CMD>lua vim.lsp.codelens.run()<CR>", { desc = "CodeLens Action" })
set("n", "<Space>lq", "<CMD>lua vim.lsp.diagnostic.set_loclist()<CR>", { desc = "Quickfix" })
set("n", "<Space>lr", "<CMD>lua vim.lsp.buf.rename()<CR>", { desc = "Rename" })
