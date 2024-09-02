return {
	"akinsho/bufferline.nvim",
	event = { "BufAdd" },
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({})
	end,
}
