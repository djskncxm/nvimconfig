return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<c-\>]],
			winbar = {
				enabled = false,
				name_formatter = function(term)
					return term.name
				end,
			},
		})
	end,
	keys = {
		{ "<C-f>", "<Cmd>ToggleTerm direction=float<cr>",      desc = "ToggleTerm float" },
		{ "<C-k>", "<Cmd>ToggleTerm direction=vertical<cr>",   desc = "ToggleTerm version" },
		{ "<C-t>", "<Cmd>ToggleTerm direction=horizontal<cr>", desc = "ToggleTerm horizontal" },
	},
}
