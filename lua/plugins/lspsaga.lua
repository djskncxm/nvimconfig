return {
	'nvimdev/lspsaga.nvim',
	lazy = true,
	event = 'LspAttach',
	key = {
		vim.keymap.set("n","<S-k>","<cmd>Lspsaga hover_doc<CR>"),
		vim.keymap.set("n","rn","<cmd>Lspsaga rename<CR>"),
		vim.keymap.set("n","<S-f>","<cmd>Lspsaga finder<CR>")
	},
	config = function()
		require('lspsaga').setup({})
	end,
	dependencies = {
		'nvim-treesitter/nvim-treesitter', -- optional
		'nvim-tree/nvim-web-devicons', -- optional
	}
}
