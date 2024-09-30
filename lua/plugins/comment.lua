return {
	"numToStr/Comment.nvim",
	config = function()
		require('Comment').setup({
			-- Настройки комментирования
			toggler = {
				line = 'gcc',
				block = 'gbc', -- Для блочного комментирования используйте 'gbc'
			},
			opleader = {
				line = 'gc',
				block = 'gb',
			},
			pre_hook = function(ctx)
				-- Проверка, используется ли блочное комментирование
				if ctx.ctype == require('Comment.utils').ctype.blockwise and vim.fn.visualmode() then
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'nx', false)
				end
				-- Дополнительная проверка на частичное выделение строки
				local U = require('Comment.utils')
				local type = ctx.ctype == U.ctype.line and '__default' or '__multiline'
				local location = require('ts_context_commentstring.utils').get_cursor_location()
				return require('ts_context_commentstring.internal').calculate_commentstring({
					key = type,
					location = location,
				})
			end,
		})
	end
}
