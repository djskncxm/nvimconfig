return {
	"stevearc/conform.nvim",
	cmd = { "ConformInfo" }, -- 可以保留这个命令用于查看格式化状态
	keys = {
		{
			"fr",
			function()
				require("conform").format({ async = true })
			end,
			mode = "n", -- 可以指定为普通模式
			desc = "Format buffer",
		},
	},
	opts = {
		-- 格式化器配置
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff" },
			c = { "clang-format" },
			cpp = { "clang-format" }, -- 对于C和C++统一使用 clang-format
			java = { "clang-format" }, -- 可以统一为 clang-format，或者使用 java-specific 格式化工具
			asm = { "asmfmt" },
		},
		-- 默认格式化选项
		default_format_opts = {
			lsp_format = "fallback", -- 如果LSP格式化失败，使用备选格式化工具
		},
		-- 格式化时的超时时间
		format_on_save = {
			timeout_ms = 500,
			-- 可以添加条件判断，例如只在特定文件类型下启用自动格式化
		},
		-- 自定义格式化器
		formatters = {
			stylua = {
				command = "/home/duck/.cargo/bin/stylua",
				prepend_args = { "--indent-width", "8" },
			},
			ruff = {
				command = "/home/duck/.local/bin/ruff",
				prepend_args = { "check" },
			},
			["clang-format"] = {
				command = "/usr/bin/clang-format", -- 统一使用 clang-format
				-- clang-format 可以添加更多定制参数
				prepend_args = { "--style=file" },
			},
		},
	},
	-- 初始化时配置 Vim 的 format 表达式
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	-- 事件绑定的优化（如果想要在保存时自动格式化）
	-- event = { "BufWritePre" }, -- 这个事件会在保存文件前触发
}
