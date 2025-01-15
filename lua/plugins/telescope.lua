return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	lazy = true,
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
	keys = {
		{ "<leader>ff", "<Cmd>Telescope find_files<CR>" },
		{ "<leader>fg", "<Cmd>Telescope live_grep<CR>" },
		{ "<leader>fb", "<Cmd>Telescope buffers<CR>" },
		{ "<leader>fh", "<Cmd>Telescope help_tags<CR>" },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				layout_config = {
					vertical = { width = 0.5 },
				},
			},
			-- pickers = { find_files = { theme = "dropdown" }, },
		})
	end,
}
