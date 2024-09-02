return {
	"rcarriga/nvim-notify",
	config = function()
		vim.notify = require("notify")
		require("notify")("主其实很在乎，你今天写代码了没有？")
	end,
}
