-- 1) Из таблицы Customer получить новый столбец 'location' описывающий страну и штат Customer'a
--|
SELECT Country || " " || State AS location FROM Customer;
--|
--|
-- 2)Отсортировать Customer по второму символу в почте
--|
SELECT * FROM Customer
ORDER BY substr(Email, 2, 1);
--|
-- 3)Отсортировать Customer по 4 последним цифрам телефона
--|
SELECT *,
       substr(replace(replace(Phone, " ", ""), "-", ""), -4) AS phone_last_four_digits
       FROM Customer
ORDER BY phone_last_four_digits;
--|
-- 4)Отсортировать всех Customer из USA чтобы: NULL по Company были в конце,
-- SupportRepId были отсортированы по убыванию
--|
SELECT * FROM Customer
WHERE Country = 'USA'
ORDER BY Company DESC NULLS LAST, SupportRepId  DESC;
--|
-- 5)Вывести таблицу Customer, отсортированную по следующим правилам:
-- State = {SP,QC,RJ}, страна Denmark, далее все остальные строки.
-- NULL по State указать в конце таблицы
-- |
SELECT State,
       Country,
       iif(State IN('SP', 'QC', 'RJ'), 1, 0) AS is_in,
       Country = 'Denmark' AS is_den,
       State IS NULL AS is_null
       FROM Customer
ORDER BY is_in DESC, is_den DESC, is_null;
