vim.opt.relativenumber = true
vim.o.number = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.clipboard = "unnamedplus"
vim.o.cursorline = true
vim.opt.termguicolors = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.signcolumn = "yes"
vim.bo.shiftwidth = 8
vim.g.mapleader = " "
vim.g.leader = " "

vim.opt.mouse = "a"
vim.opt.foldenable = false
vim.o.scrolloff = 15
vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = false,
	signs = true,
	update_in_insert = true,
})
local signs = { Error = "💩", Info = "󰋼", Hint = "󰌵", Warn = "🤡" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- vim.api.nvim_set_hl(0, "CocMenuSel", { fg = "#FFCCCC", bg = "#666666" })

vim.g.dbs = {
	{ name = "Windows", url = "mysql://root:qpal@192.168.0.15:3306" },
	{ name = "Linux", url = "mysql://rootqpal@localhost" },
}
