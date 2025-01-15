return {
	"Wansmer/symbol-usage.nvim",
	event = "LspAttach", -- 适用于 Neovim 0.9
	config = function()
		local function h(name) return vim.api.nvim_get_hl(0, { name = name }) end

		-- 高亮设置
		local hl_groups = {
			{ 'SymbolUsageRounding', { fg = h('CursorLine').bg, italic = true } },
			{ 'SymbolUsageContent',  { bg = h('CursorLine').bg, fg = h('Comment').fg, italic = true } },
			{ 'SymbolUsageRef',      { fg = h('Function').fg, bg = h('CursorLine').bg, italic = true } },
			{ 'SymbolUsageDef',      { fg = h('Type').fg, bg = h('CursorLine').bg, italic = true } },
			{ 'SymbolUsageImpl',     { fg = h('@keyword').fg, bg = h('CursorLine').bg, italic = true } },
		}

		-- 批量设置高亮
		for _, hl in ipairs(hl_groups) do
			vim.api.nvim_set_hl(0, hl[1], hl[2])
		end

		local function text_format(symbol)
			local res = {}

			local round_start = { '', 'SymbolUsageRounding' }
			local round_end = { '', 'SymbolUsageRounding' }
			local stacked_content = symbol.stacked_count > 0 and ("+%s"):format(symbol.stacked_count) or ''

			local function add_symbol_info(icon, hl_group, count, desc)
				if count then
					table.insert(res, round_start)
					table.insert(res, { icon, hl_group })
					table.insert(res, { ('%s %s'):format(count, desc), 'SymbolUsageContent' })
					table.insert(res, round_end)
				end
			end

			-- Add reference information
			if symbol.references then
				local usage = symbol.references <= 1 and 'usage' or 'usages'
				local num = symbol.references == 0 and 'no' or symbol.references
				add_symbol_info('󰌹 ', 'SymbolUsageRef', num, usage)
			end

			-- Add definition information
			if symbol.definition then
				add_symbol_info('󰳽 ', 'SymbolUsageDef', symbol.definition, 'defs')
			end

			-- Add implementation information
			if symbol.implementation then
				add_symbol_info('󰡱 ', 'SymbolUsageImpl', symbol.implementation, 'impls')
			end

			-- Add stacked functions content
			if stacked_content ~= '' then
				add_symbol_info(' ', 'SymbolUsageImpl', stacked_content, 'stacked functions')
			end

			return res
		end

		-- 加载配置
		require('symbol-usage').setup({
			text_format = text_format,
		})
	end,
}
