return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			require("notify")("主其实很在乎，你今天写代码了没有？"),
			background_colour = "#000000",
		})
	end,
}
