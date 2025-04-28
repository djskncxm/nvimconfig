return {
	"neovim/nvim-lspconfig",
	event = "User FilePost",
	config = function()
		require("lspconfig").lua_ls.setup({
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						globals = {
							"vim",
							"require",
						},
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("lua", true),
					},
					telemetry = {
						enable = false,
					},
					completion = {
						callSnippet = 'Replace',
					},
				},
			},
		})
	end,
}
