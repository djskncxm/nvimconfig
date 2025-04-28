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
vim.ui.select = require('dropbar.utils.menu').select
vim.opt.foldenable = false
vim.o.scrolloff = 15
vim.notify = require("notify")
vim.o.tabstop = 8
vim.o.softtabstop = 8
vim.g.c_syntax_for_h = 1
vim.loader.enable()
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 1
-- vim.env.PROF = 0
if vim.env.PROF then
	-- example for lazy.nvim
	-- change this to the correct path for your plugin manager
	local snacks = vim.fn.stdpath("data") .. "/lazy/snacks.nvim"
	vim.opt.rtp:append(snacks)
	require("snacks.profiler").startup({
		startup = {
			event = "VimEnter", -- stop profiler on this event. Defaults to `VimEnter`
			-- event = "UIEnter",
			-- event = "VeryLazy",
		},
	})
end

local map = vim.keymap.set

vim.diagnostic.config({
	virtual_lines = true,
	virtual_text = false,
	update_in_insert = true,
	signs = {
		text = {
			[vim.diagnostic.severity.HINT]  = "🤓",
			[vim.diagnostic.severity.ERROR] = "💩",
			[vim.diagnostic.severity.INFO]  = "🤔",
			[vim.diagnostic.severity.WARN]  = "🤣"
		}
	},
})



vim.g.dbs = {
	-- { name = "Windows", url = "mysql://root:qpal@192.168.0.15:3306" },
	{ name = "Linux", url = "mysql://root:qpal@localhost" },
}

if vim.g.neovide then
	vim.o.guifont = "Iosevka Nerd Font:h9"
	vim.g.neovide_hide_mouse_when_typing = false
	vim.g.neovide_confirm_quit = true
	vim.g.neovide_cursor_vfx_mode = "ripple"
	vim.neovide_confirm_quit = true
	vim.g.neovide_opacity = 0.95
	vim.g.neovide_cursor_animation_length = 0.1
	vim.cmd [[colorscheme synthwave84]]
end

local Terminal = require('toggleterm.terminal').Terminal
local dbs = Terminal:new({
	cmd = 'nvim +DBUI"',
	dir = "git_dir",
	direction = "float",
	float_opts = {
		border = "double",
	},
	-- function to run on opening the terminal
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
	end,
	-- function to run on closing the terminal
	on_close = function()
		vim.cmd("startinsert!")
	end,
})

function _DB_toggle()
	dbs:toggle()
end

map("n", "<leader>g", "<Cmd>lua _DB_toggle()<CR>", { noremap = true, silent = true })
