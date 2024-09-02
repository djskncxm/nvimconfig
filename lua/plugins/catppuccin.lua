return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = false,
	config = function()
		require("catppuccin").setup({
			transparent_background = false,
			coc_nvim = false,
			notify = true,
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
