# Тестовое задание от ?
Само задание находится в папке,после проверки пришел отказ:
Предложенная модель не полностью соответствует правилам нормализации. Например, для регионов рекомендуется выделить отдельную справочную таблицу, также как и для цели кредита и вида продукта, т.к. значения для них выбираются на форме из выпадающего списка.

При установлении связи между этими таблицами стоит учесть особенности их хранения, к примеру – между параметрами заявки и дополнительными сервисами нужно установить связь «многие-ко-многим», т.к. у одной заявки можно выбрать несколько доп.сервисов, так и один доп.сервис может быть добавлен в несколько заявок.
Исправленное решение model.mwb
