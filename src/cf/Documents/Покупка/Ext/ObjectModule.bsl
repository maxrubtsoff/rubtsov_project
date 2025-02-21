﻿
Процедура ОбработкаПроведения(Отказ, Режим)
	
	Если Объем = 0 Тогда
		Сообщить(СтрШаблон("Не задан объем покупаемого товара: %1, укажите объем в регистре ""Объемы товаров""", Товар.Наименование));
		Отказ = Истина;
		Возврат;
	КонецЕсли;
	
	// регистр Касса Расход
	Движения.Касса.Записывать = Истина;
	Движение = Движения.Касса.Добавить();
	Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
	Движение.Период = Дата;
	Движение.Сумма = Цена * Количество;
	
	// регистр Трюм Приход
	Движения.Трюм.Записывать = Истина;
	Движение = Движения.Трюм.Добавить();
	Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
	Движение.Период = Дата;
	Движение.Товар = Товар;
	Движение.Объем = Объем;
	Движение.Количество = Количество;
	
	// регистр ЗаполненностьТрюма Приход
	Движения.ЗаполненностьТрюма.Записывать = Истина;
	Движение = Движения.ЗаполненностьТрюма.Добавить();
	Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
	Движение.Период = Дата;
	Движение.Объем = Объем;
	
КонецПроцедуры
