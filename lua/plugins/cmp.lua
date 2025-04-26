return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	opts = function(_, opts)
		opts.sources = opts.sources or {}
		table.insert(opts.sources, {
			name = "lazydev",
			group_index = 0, -- set group index to 0 to skip loading LuaLS completions
		})
	end,
	dependencies = {
		{
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		{ "brenoprata10/nvim-highlight-colors" },
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			dependencies = { "rafamadriz/friendly-snippets" },
			build = "make install_jsregexp",
			opts = { history = true, updateevents = "TextChanged,TextChangedI" },
			config = function(_, opts)
				local luasnip = require("luasnip")
				luasnip.config.set_config(opts)

				local load_vscode = require("luasnip.loaders.from_vscode").lazy_load
				local load_snipmate = require("luasnip.loaders.from_snipmate").lazy_load
				local load_lua = require("luasnip.loaders.from_lua").lazy_load

				load_vscode({
					exclude = vim.g.vscode_snippets_exclude or {},
				})
				load_snipmate({ paths = vim.g.snipmate_snippets_path or "" })
				load_lua({ paths = vim.g.lua_snippets_path or "" })

				vim.api.nvim_create_autocmd("InsertLeave", {
					callback = function()
						local luasnip_session = require("luasnip").session
						if luasnip_session.current_nodes[vim.api.nvim_get_current_buf()] and not luasnip_session.jump_active then
							luasnip.unlink_current()
						end
					end,
				})
			end,
		},
		{
			"hrsh7th/cmp-cmdline",
			event = { "CmdLineEnter" },
			opts = { history = true, updateevents = "CmdlineEnter,CmdlineChanged" },
			config = function()
				local cmp = require("cmp")

				cmp.setup.cmdline("/", {
					mapping = cmp.mapping.preset.cmdline(),
					sources = { { name = "buffer" } },
				})

				cmp.setup.cmdline(":", {
					mapping = cmp.mapping.preset.cmdline(),
					sources = cmp.config.sources({
						{ name = "path" },
					}, {
						{ name = "cmdline", option = { ignore_cmds = { "Man", "!" } } },
					}),
				})
			end,
		},
		{
			"windwp/nvim-autopairs",
			event = 'InsertEnter',
			opts = {
				fast_wrap = {},
				disable_filetype = { "TelescopePrompt", "vim" },
			},
			config = function(_, opts)
				local autopairs = require("nvim-autopairs")
				autopairs.setup(opts)

				local cmp_autopairs = require("nvim-autopairs.completion.cmp")
				require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
			end,
		},
	},
	config = function()
		local cmp = require("cmp")

		local luasnip = require("luasnip")
		local default_mapping = cmp.mapping.preset.insert({
			["<C-p>"] = cmp.mapping.select_prev_item(),
			["<C-n>"] = cmp.mapping.select_next_item(),
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.close(),
			["<CR>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					if luasnip.expandable() then luasnip.expand() else cmp.confirm({ select = true, }) end
				else
					fallback()
				end
			end),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.locally_jumpable(1) then
					luasnip.jump(1)
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.locally_jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		})

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered({
					winhighlight =
					"Normal:Normal,FloatBorder:FloatBorder,CursorLine:CursorLineBG,Search:None",
					border = { "󰄛", "─", "󰄛", "│", "󰄛", "─", "󰄛", "│" },
				}),
				documentation = {
					border = "rounded",
					winhighlight =
					"Normal:Normal,FloatBorder:FloatBorder,CursorLine:CursorLineBG,Search:None",
					side_padding = 2,
				},
			},
			mapping = default_mapping,
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = 'luasnip' },
				{ name = "vim-dadbod-completion" },
				{ name = 'nvim_lsp_signature_help' },
			}, {
				{ name = "buffer" },
				{ name = "path" },
			}),
			formatting = {
				fields = { "abbr", "kind", "menu" },
				format = function(entry, vim_item)
					local icons = {
						Text = "󰉿",
						Method = "󰆧",
						Function = "󰊕",
						Constructor = "",
						Field = "󰜢",
						Variable = "󰀫",
						Class = "󰠱",
						Interface = "",
						Module = "",
						Property = "󰜢",
						Unit = "󰑭",
						Value = "󰎠",
						Enum = "",
						Keyword = "󰌋",
						Snippet = "",
						Color = "󰏘",
						File = "󰈙",
						Reference = "󰈇",
						Folder = "󰉋",
						EnumMember = "",
						Constant = "󰏿",
						Struct = "󰙅",
						Event = "",
						Operator = "󰆕",
						TypeParameter = "",
					}
					vim_item.kind = icons[vim_item.kind] .. " " .. vim_item.kind .. " "
					vim_item.menu = ({
						nvim_lsp = "[LSP]", buffer = "[Buffer]", luasnip = "[LuaSnip]",
						text = "[TEXT]", path = "[PATH]", vim_dadbod_completion = "[DB]",
					})[entry.source.name] or "󰼇"

					return vim_item
				end,
			},
			experimental = {
				ghost_text = true,
			}
		})
	end,
}
