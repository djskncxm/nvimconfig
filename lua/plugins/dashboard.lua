--[[ return {
	"goolord/alpha-nvim",
	priority = 1000,
	dependencies = { "echasnovski/mini.icons" },
	config = function()
		require("alpha").setup(require("alpha.themes.startify").config)
	end,
} ]]
return {
	'nvimdev/dashboard-nvim',
	event = 'VimEnter',
	config = function()
		require('dashboard').setup {
			-- config
		}
	end,
	dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
