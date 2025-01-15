return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate", -- 确保在需要时更新
	lazy = true,    -- 懒加载，避免启动时加载
	event = 'BufReadPost', -- 触发条件，文件读取后加载
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c",
				"lua",
				"luadoc",
				"vim",
				"javascript",
				"html",
				"cpp",
				"python",
			},
			sync_install = true,   -- 确保同步安装，避免出现版本不一致的情况
			highlight = {
				enable = true, -- 启用高亮
				additional_vim_regex_highlighting = false, -- 禁用额外的正则高亮
			},
			indent = { enable = true }, -- 启用缩进
			-- 如果有其他功能需要，可以在这里补充
		})
	end,
}
