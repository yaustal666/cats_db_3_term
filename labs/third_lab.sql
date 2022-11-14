-- 1)Проанализировать созданную альтернативную таблицу Customer,
-- вывести страны и количества записей для каждой из них (1 запросом)
--|
SELECT Country, COUNT(*) FROM CUSTOM
GROUP BY Country;
--|
-- 2)Для страны с самым большим количеством записей удалить из
-- таблицы строку(ки) имеющую(ие) информацию о компании
--| некрасиво как-то, надо подумать ещё
DELETE FROM CUSTOM
WHERE Country = (SELECT Country FROM (SELECT Country, MAX(NUM)
                                      FROM (SELECT Country, COUNT(*) NUM FROM CUSTOM
                                            GROUP BY Country)))
AND Company IS NOT NULL;
--|
-- 3)Вставить данные из таблицы Employee в таблицу полученную в задании 2, отсутствующие данные заполнить NULL
--|
INSERT INTO CUSTOM(FirstName, LastName,
                   Address, City, State,
                   Country, PostalCode,
                   Phone, Fax, Email)
SELECT FirstName, LastName,
       Address, City, State,
       Country, PostalCode,
       Phone, Fax, Email
FROM EMPLO;

SELECT * FROM CUSTOM;
--|
-- 4)Добавить пользователя Evangeline Lilly
--|
INSERT INTO CUSTOM (FirstName, LastName)
VALUES ("Evangeline", "Lilly");
--|
-- 5)Исправить ошибку возникникшую в данных (подсказка задание 2 и 4)
--|

--|
-- Упрощение: в пятом задании достаточно показать адекватную таблицу содержащую не все данные из предыдущей
<<<<<<< HEAD
-- а только 'FirstName','LastName' и исправленную колонку с ошибкой.
=======
-- а только 'FirstName','LastName' и исправленную колонку с ошибкой."
>>>>>>> e7d4cc2ddab61057151a8a77ddd53df0f5eb0d8a
