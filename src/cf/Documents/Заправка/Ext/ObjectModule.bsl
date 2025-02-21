﻿
Процедура ОбработкаПроведения(Отказ, Режим)
	
	Если РегистрыНакопления.Касса.Остатки()[0].Сумма < Сумма Тогда
		Сообщить("Недостаточно средства для покупки топлива, займите деньги у банка");
		Отказ = Истина;
		Возврат;
	КонецЕсли;
	
	// регистр ЗапасТоплива Приход
	Движения.ЗапасТоплива.Записывать = Истина;
	Движение = Движения.ЗапасТоплива.Добавить();
	Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
	Движение.Период = Дата;
	Движение.Количество = КоличествоТоплива;
	
	// регистр Касса Расход
	Движения.Касса.Записывать = Истина;
	Движение = Движения.Касса.Добавить();
	Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
	Движение.Период = Дата;
	Движение.Сумма = Сумма;
	
КонецПроцедуры
