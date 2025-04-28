local map = vim.keymap.set

map("i", "jk", "<ESC>")

map("n", "<C-l>", "<C-w>l")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")

-- map("n", "<tab>", "<Cmd>BufferLineCycleNext<cr>")
-- map("n", "<S-tab>", "<Cmd>BufferLineCyclePrev<CR>")


map("n", "<leader>x", "<Cmd>bdelete<CR>")
