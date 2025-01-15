return {
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	-- event = { "BufAdd" },
	lazy = true,
	config = function()
		require("lsp_lines").setup({})
	end,
}
