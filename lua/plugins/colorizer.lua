return {
	"NvChad/nvim-colorizer.lua",
	-- event = { "BufReadPost" },
	event = 'BufReadPost',
	config = function()
		require("colorizer").setup()
	end,
}
