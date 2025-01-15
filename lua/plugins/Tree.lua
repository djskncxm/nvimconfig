return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = true,
	keys = {
		{ "<C-n>", "<Cmd>NvimTreeToggle<CR>", desc = "NvimTreefocus" },
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},
	config = function()
		require("nvim-tree").setup({
			renderer = {
				full_name = true,
				group_empty = true,
				special_files = {},
				symlink_destination = false,
				indent_markers = {
					enable = true,
				},
			},
		})
	end,
}
