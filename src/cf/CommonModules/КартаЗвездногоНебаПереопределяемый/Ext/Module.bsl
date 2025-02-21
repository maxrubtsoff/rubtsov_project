﻿#Область ПрограммныйИнтерфейс

// Местоположение - Структура:
//  * ТекущаяПланета - СправочникСсылка.Планеты - Планета, на которой находится корабль.
//  * ТекущийЗапасТоплива - Число - Сколько топлива осталось в баках.
//
Процедура ПриОпределенииМестоположения(Местоположение) Экспорт
	
	Местоположение.ТекущаяПланета = Константы.ТекущаяПланета.Получить();
	Местоположение.ТекущийЗапасТоплива = РегистрыНакопления.ЗапасТоплива.Остатки()[0].Количество;
	
КонецПроцедуры

// Местоположение - Структура:
//  * ТекущаяПланета - СправочникСсылка.Планеты - Планета, на которой находится корабль.
//  * ПанетаНазначения - СправочникСсылка.Планеты - Планета, на которую корабль будет перемещен.
//  * ПотраченоТоплива - Число - Затраченное топливо на перелет.
//
Процедура ПриУстановкеМестоположения(Местоположение) Экспорт
	
	Полет = Документы.Полет.СоздатьДокумент();
	Полет.Дата = ТекущаяДатаСеанса();
	Полет.ИсходныйПункт = Местоположение.ТекущаяПланета;
	Полет.КонечныйПункт = Местоположение.ПанетаНазначения;
	Полет.КоличествоТоплива = Местоположение.ПотраченоТоплива;
	Полет.Записать(РежимЗаписиДокумента.Проведение);
	
КонецПроцедуры

#КонецОбласти
