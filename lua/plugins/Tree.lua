return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {},
	keys = {
		{ "<C-n>", "<Cmd>NvimTreeToggle<cr>", desc = "NvimTreefocus" },
	},
	config = function()
		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 35,
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = true,
			},
		})
	end,
}
