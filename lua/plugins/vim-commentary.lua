return {
	"tpope/vim-commentary",
	config = function()
		-- Настройка vim-commentary не требует особых конфигураций,
		-- так как плагин работает "из коробки".
		-- Однако, если необходимо, можно добавить собственные команды
		-- или настроить его для определенных типов файлов.

		-- Пример настройки кастомных команд или автокоманд
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "python", "lua", "javascript" },
			callback = function()
				-- Здесь можно добавить специфические команды или настройки
				-- для конкретных типов файлов
			end,
		})

		-- Дополнительная информация по плагину vim-commentary:
		-- Основные команды:
		-- 1. Комментирование строки: gcc
		-- 2. Комментирование блока: gc в визуальном режиме
	end,
	event = "VeryLazy", -- Опционально, для ленивой загрузки
}
