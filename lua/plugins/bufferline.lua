return {
	"akinsho/bufferline.nvim",
	-- event = { "BufAdd" },
	key = {
		vim.keymap.set("n", "<tab>", "<Cmd>BufferLineCycleNext<cr>"),
		vim.keymap.set("n", "<S-tab>", "<Cmd>BufferLineCyclePrev<CR>"),
		vim.keymap.set("n", "<leader>x", "<Cmd>bdelete<CR>"),
	},
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				diagnostics = "nvim_lsp",
				indicator = {
					style = 'underline'
				},
				separator_style = "slant",
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "left",
						separator = true,
					},
				},
			}
		})
	end,
}
