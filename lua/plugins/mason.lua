return {
	"williamboman/mason.nvim",
	lazy = true,
	cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_pending = " ",
					package_installed = " ",
					package_uninstalled = " ",
				},
			},
		})
	end,
}
