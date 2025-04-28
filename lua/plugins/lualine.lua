return {
	"nvim-lualine/lualine.nvim",
	-- event = { "BufNewFile",  },
	event = {   "BufReadPre" },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	options = { theme = "catppuccin" },
	config = function()
		require("lualine").setup()
	end,
}
