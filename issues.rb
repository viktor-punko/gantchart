общая убогость
ваще пиздец убогость
большое условие когда определяется класс новой ячейки
в разных браузерах разная реакция на колесико?

ЗАДАНИЕ
Автоматическое расчёт дат начала и окончания задач, подзадач и вех (для подзадач и вех используется полностью тот же алгоритм, что и для задач);
(Сам алгоритм нечто вроде алгоритма сортировки, когда несколько раз пробегается массив задач, пока они не встанут на свои места.)
Модификация существующей функции вывода задач – чтобы ещё вехи и подзадачи отражала (пока, это див с меньшей высотой) – это совсем просто (стрелки всякие не рисуем пока);
Инфо:     Веха – та же задача, длительность которой равна нулю. Ну и поэтому она обозначается ромбиком. Ромбик делается из дива очень легко. Вот так: http://habrahabr.ru/post/126207/

Вам понадобятся КАК МИНИМУМ знать и реализовать вот что (это ):
Задача – Название, Трудоёмкость (сколько времени потребуется ресурсам). 
У задач бывают фиксированные даты начала (или даты конца) и автоматически рассчитанные даты начала (конца) – в скриншоте это обозначено кнопкой или прямоугольником;
При автоматических датах начала важную роль играет дата начала проекта (и/или дата конца проекта?), поскольку в настройках задачи можно указывать когда её лучше выполнять (по умолчанию стоит – как можно ближе к дате начала проекта)
Автоматический расчёт использует информацию о связях между задачами и об их вложенности. Связи бывают четырёх типов: ОН:окончание – начало (после окончания предшествующей задачи запускается последующая задача), НН:начало-начало (задачи должны быть запущены одновременно), ОО: окончание-окончание, НО:начало-окончание. Плюс между такими задачами может быть создано запаздывание (т.е. не сразу начинается, а через несколько дней, недель и т.п., оно может указываться и со знаком минус (тогда это будет уже опережение).
Есть подзадачи, подподзадачи и так далее, до любого уровня; Длительность задачи определяется длительностью подзадач. Хотя она может быть задана и явно, но тогда может возникнуть конфликт между длительностью задачи и рассчитанной длительностью подзадач. Вроде бы по-разному такие суммарные задачи обозначаются и вроде бы при конфликте цвет красный делается конфликтной суммарной подзадачи

ТАКИМ ОБРАЗОМ, ИЗНАЧАЛЬНО У НАС БУДЕТ, наверное, такой МАССИВ ИЗ ЗАДАЧ:
{
name:
duration:
durAuto: значение рассчитанной длительности (если в эту задачу вложены другие)
precurs: - одномерный массив или СТРОКА предшественников, типов связи и запаздывания (например, одна запись в этом массиве будет выглядеть так: «5ОН+2дней», если строка, то так (объединим две записи): «5ОН+2дней;7НН» - это означает, что задача, которая описывается в данной момент запускается после выполнения 5-ой задачи + 2 дня (рабочих), и она должна начинаться одновременно с 7-ой задачей)
level: число, отражающее уровень вложенности, в кого вложено, определяется вышестоящей задачей, у которой уровень ниже.
fixed: значения start/end/none
start:
startAuto: значение рассчитанной даты
end:
endAuto: значение рассчитанной даты
}

По два раза всё записано –ауто и неауто, поскольку рассчитанное значение и введённое значение может не совпадать, о чём цветом на диаграмме показывается пользователю. Также диалоговое окно выходит и говорит – есть конфликт….





1. В Цикле перебираем задачи
Тело цикла: берем задачу. Смотрим текущее положение ее предшественников и вычисляем положение этой задачи.
Есть ли эта задача является суммарной. Тоесть в не е его вложены другие задачи. Ты вычисляем ее длину. Исходя из известных на текущий момент положений взложенных задач
Тело цикла закончилось
Есть ли в упомянутом цикле изменилось положение или длительность хотя бы одной задачи
То запускаем цикл заново
Многократное выполнение этого цикла позволит наконец то расставить задачи по порядку
Остался один вопрос - как как выполнить это действие : "Смотрим текущее положение ее предшественников и вычисляем положение этой задачи."
Если бы присутствовали связи только одного вида: ОН + запаздывание. То Решение собственно очевидно
Но есть связи и других видов. Тут я уже не подумал поскольку мало поигрался с проджектом. Чтобы осмыслить эти связи. Отдаю это вам на откуп. Есть ли возникнут сложности пишите продумаю и эту часть алгоритма
