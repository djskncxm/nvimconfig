return {
	"folke/tokyonight.nvim",
	-- priority = 1000,
	lazy = true,
	config = function()
		require("tokyonight").setup({
			transparent = true,
		})
		vim.cmd.colorscheme("tokyonight-night")
	end,
}
