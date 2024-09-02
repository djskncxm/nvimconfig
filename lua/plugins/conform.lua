return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"fr",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff" },
			c = { "clang-format" },
			cpp = c,
			java = c,
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		format_on_save = { timeout_ms = 500 },
		formatters = {
			stylua = {
				command = "/home/duck/.cargo/bin/stylua",
				prepend_args = {
					"--indent-width",
					"8",
				},
			},
			ruff = {
				command = "/home/duck/.local/bin/ruff",
				prepend_args = {
					"check",
				},
			},
			clang_fromt = {
				command = "/usr/bin/clang-format",
			},
		},
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
