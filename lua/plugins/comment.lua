return {
	"numToStr/Comment.nvim",
	-- event = { "BufReadPre", "BufNewFile", "BufReadPost" },
	event = 'BufReadPost',
	config = function()
		require("Comment").setup()
	end,
}
