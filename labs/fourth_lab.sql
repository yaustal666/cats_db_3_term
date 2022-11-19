CREATE TABLE TASK1 AS
    SELECT * FROM PlaylistTrack;
------------------------------------------------------------------------------------------------------------------------
-- 1)Для каждой записи в PlaylistTrack добавить столбец PlaylistName из таблицы Playlist
ALTER TABLE TASK1
ADD COLUMN PLNAME VARCHAR(30);

UPDATE TASK1
SET PLNAME = pl.Name
FROM (SELECT * FROM Playlist) pl
WHERE TASK1.PlaylistId = pl.PlaylistId;
------------------------------------------------------------------------------------------------------------------------
-- 2)Создать новую таблицу где для каждого PlaylistId будет содержаться информация об id треках записанная
-- через запятую в столбце List_id_track
CREATE TABLE TASK2 AS
SELECT PlaylistId, GROUP_CONCAT(TrackId, ",") list_track_id
FROM TASK1
GROUP BY PlaylistId;
------------------------------------------------------------------------------------------------------------------------
-- 3)Посчитать для каждого PlaylistId процентную долю треков от всего количества треков
SELECT PlaylistId,
       (length(list_track_id) - length(replace(list_track_id, ",", "")) + 1) * 100.0 / (SELECT COUNT(*) FROM TASK1)
FROM TASK2;
-- Если из всех плейлистов

SELECT PlaylistId,
       (length(list_track_id) - length(replace(list_track_id, ",", "")) + 1) * 100.0 / (SELECT COUNT(*) FROM Track)
FROM TASK2;
-- Если просто из всех треков
------------------------------------------------------------------------------------------------------------------------
-- 4)Вычислить количество дней между двумя датами (данные найти/заполнить самостоятельно)
CREATE TABLE TASK4
(
    id    INTEGER PRIMARY KEY AUTOINCREMENT,
    DATE1 TEXT NOT NULL,
    DATE2 TEXT NOT NULL,
    DIFF  INT
);

INSERT INTO TASK4(DATE1, DATE2)
VALUES (date(), date('now', '-' || cast(abs(random()) / 100000000000000 as text) || ' day'));

UPDATE TASK4
SET DIFF = julianday(DATE1) - julianday(DATE2)
WHERE DIFF IS NULL;
------------------------------------------------------------------------------------------------------------------------
-- 5)Создать календарь на месяц
WITH RECURSIVE x(dy, dm, mth, dw, wk)
    AS (
        SELECT
            date('now', '-' || strftime('%d', 'now') || ' day', '+1 day') dy,
            strftime('%d',date('now', '-' || strftime('%d', 'now') || ' day', '+1 day')) dm,
            strftime('%m',date('now')) mth,
            strftime('%w',date('now', '-' || strftime('%d', 'now') || ' day', '+1 day')) dw,
            strftime('%W',date('now', '-' || strftime('%d', 'now') || ' day', '+1 day')) wk

        UNION ALL
        SELECT
            date(julianday(dy) + 1),
            strftime('%d', date(julianday(dy) + 1)),
            mth,
            strftime('%w', date(julianday(dy) + 1)),
            strftime('%W', date(julianday(dy) + 1))
        FROM x
        WHERE strftime('%m', date(julianday(dy) + 1)) = mth
        )
    SELECT wk,
           max(case when cast(dw as integer) = 1 then dm end) as Мо,
           max(case when cast(dw as integer) = 2 then dm end) as Тu,
           max(case when cast(dw as integer) = 3 then dm end) as We,
           max(case when cast(dw as integer) = 4 then dm end) as Тh,
           max(case when cast(dw as integer) = 5 then dm end) as Fr,
           max(case when cast(dw as integer) = 6 then dm end) as Sa,
           max(case when cast(dw as integer) = 0 then dm end) as Su
    FROM x
    GROUP BY wk
    ORDER BY wk;
