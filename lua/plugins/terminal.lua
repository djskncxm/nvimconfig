return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			function(term)
				if term.direction == "horizontal" then
					return 15
				elseif term.direction == "vertical" then
					return 100
				end
			end,
			winbar = {
				enabled = false,
				name_formatter = function(term)
					return term.name
				end,
			},
		})
	end,
	keys = {
		{ "<C-f>", "<Cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" },
		{ "<C-k>", "<Cmd>ToggleTerm direction=vertical<cr>", desc = "ToggleTerm version" },
		{ "<C-t>", "<Cmd>ToggleTerm direction=horizontal<cr>", desc = "ToggleTerm horizontal" },
	},
}
