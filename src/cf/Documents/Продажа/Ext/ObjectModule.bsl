﻿
Процедура ОбработкаПроведения(Отказ, Режим)
	
	ТаблицаОстатков = РегистрыНакопления.Трюм.Остатки(, Новый Структура("Товар", Товар));
	
	Если ТаблицаОстатков[0].Количество < Количество Тогда
		Сообщить(СтрШаблон("Нельзя продать: %1 в количестве: %2, в доступном остатке только: %3", Товар.Наименование, Количество, ТаблицаОстатков[0].Количество));
		Отказ = Истина;
	КонецЕсли;
	
	Если ТаблицаОстатков[0].Объем < Объем Тогда
		Сообщить(СтрШаблон("Нельзя продать: %1 в Объеме: %2, в доступном остатке только: %3", Товар.Наименование, Объем, ТаблицаОстатков[0].Объем));
		Отказ = Истина;
	КонецЕсли;
	
	Если Отказ = Истина Тогда
		Возврат;
	КонецЕсли;
	
	// регистр Касса Приход
	Движения.Касса.Записывать = Истина;
	Движение = Движения.Касса.Добавить();
	Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
	Движение.Период = Дата;
	Движение.Сумма = Цена * Количество;
	
	// регистр Трюм Расход
	Движения.Трюм.Записывать = Истина;
	Движение = Движения.Трюм.Добавить();
	Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
	Движение.Период = Дата;
	Движение.Товар = Товар;
	Движение.Объем = Объем;
	Движение.Количество = Количество;
	
	// регистр ЗаполненностьТрюма Расход
	Движения.ЗаполненностьТрюма.Записывать = Истина;
	Движение = Движения.ЗаполненностьТрюма.Добавить();
	Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
	Движение.Период = Дата;
	Движение.Объем = Объем;
	
КонецПроцедуры
