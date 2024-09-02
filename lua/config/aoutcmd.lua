vim.api.nvim_create_autocmd({ "ExitPre" }, {
	callback = function()
		vim.opt.guicursor = "a:ver30-blinkon0"
	end,
})
