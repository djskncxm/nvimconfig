return {
	"neovim/nvim-lspconfig",
	event = "User FilePost",
	config = function()
		require("lspconfig").lua_ls.setup({
			settings = {
				Lua = {
					hint = {
						enable = true,
					},
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
				clangd = {
					InlayHints = {
						Designators = true,
						Enabled = true,
						ParameterNames = true,
						DeducedTypes = true,
					},
					fallbackFlags = { "-std=c++20" },
				}
			},
		})
	end,
}
