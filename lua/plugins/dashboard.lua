return {
	"goolord/alpha-nvim",
	priority = 1000,
	dependencies = { "echasnovski/mini.icons" },
	config = function()
		require("alpha").setup(require("alpha.themes.startify").config)
	end,
}
