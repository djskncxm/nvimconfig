--[[ vim.api.nvim_create_autocmd({ "ExitPre" }, {
	callback = function()
		vim.opt.guicursor = "a:ver30-blinkon0"
	end,
}) ]]

local function open_nvim_tree()
	require("nvim-tree.api").tree.open()
end
-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

vim.api.nvim_create_autocmd({ "TermOpen" }, {
	callback = function()
		vim.cmd("startinsert")
	end,
})
