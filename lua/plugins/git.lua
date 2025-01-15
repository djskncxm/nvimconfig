return {
	"lewis6991/gitsigns.nvim",
	event = 'BufReadPost',
	-- event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("gitsigns").setup()
	end,
}
