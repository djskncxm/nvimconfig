local map = vim.keymap.set

map("i", "jk", "<ESC>")

map("n", "<C-l>", "<C-w>l")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")

map("n", "<tab>", "<Cmd>BufferLineCycleNext<cr>")
map("n", "<S-tab>", "<Cmd>BufferLineCyclePrev<CR>")

map("n", "<C-y>", "<Cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "<leader>im", "<Cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "<leader>de", "<Cmd>lua vim.lsp.buf.declaration()<CR>")
map("n", "<leader>rf", "<Cmd>lua vim.lsp.buf.refreences()<CR>")
map("n", "<leader>x", "<Cmd>bdelete<CR>")
map("n", "<leader>g", "<Cmd>lua _DB_toggle()<CR>", { noremap = true, silent = true })
