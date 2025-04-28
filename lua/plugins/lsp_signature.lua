return {
	"ray-x/lsp_signature.nvim",
	event = "InsertEnter",
	opts = {
		handler_opts = {
			border = "rounded" -- double, rounded, single, shadow, none, or a table of borders
		},
		hi_parameter = "LspSignatureActiveParameter",
		floating_hint_prefix = "🐼 ",
		window = true,
		floating_window_off_x = 5, -- adjust float windows x position.
		floating_window_off_y = function() -- adjust float windows y position. e.g. set to -2 can make floating window move up 2 lines
			-- local linenr = vim.api.nvim_win_get_cursor(0)[1] -- buf line number
			local pumheight = vim.o.pumheight
			local winline = vim.fn.winline() -- line number in the window
			local winheight = vim.fn.winheight(0)

			if winline - 1 < pumheight then
				return pumheight
			end

			if winheight - winline < pumheight then
				return -pumheight
			end
			return 0
		end,
	},
	config = function(_, opts) require("lsp_signature").setup(opts) end
}
