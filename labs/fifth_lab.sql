-- Таблица для жанров, у каждого отдельного аниме много жанров, но тут подразумевается основные
CREATE TABLE genre(
    genre_id INTEGER PRIMARY KEY AUTOINCREMENT,
    genre_name VARCHAR(30) NOT NULL UNIQUE
);
-- Таблица для студий, которые делали аниме, одно аниме - одна студия
CREATE TABLE studio(
    studio_id INTEGER PRIMARY KEY AUTOINCREMENT,
    studio_name VARCHAR(30) NOT NULL UNIQUE
);
-- Таблица для авторов идеи или сценарист если не по манге
CREATE TABLE author(
    author_id INTEGER PRIMARY KEY AUTOINCREMENT,
    author_name VARCHAR(30) NOT NULL
);

-- Главная таблица, где указан жанр, автор, указана студия, указано название, указан статус
CREATE TABLE anime(
    anime_id INTEGER PRIMARY KEY AUTOINCREMENT,
    author_id INTEGER NOT NULL,
    studio_id INTEGER NOT NULL,
    title TEXT NOT NULL,
    status TEXT NOT NULL CHECK(status IN('ongoing', 'announcement', 'completed') ),
    FOREIGN KEY(author_id) REFERENCES author(author_id),
    FOREIGN KEY(studio_id) REFERENCES studio(studio_id)
);

-- Так как связь между жанрами и аниме многие ко многим то создаем вспомогательную связующую таблицу
CREATE TABLE genre_anime(
    genre_anime_id INTEGER PRIMARY KEY AUTOINCREMENT,
    anime_id INTEGER NOT NULL,
    genre_id INTEGER NOT NULL,
    FOREIGN KEY(anime_id) REFERENCES anime(anime_id),
    FOREIGN KEY(genre_id) REFERENCES genre(genre_id)
);
------------------------------------------------------------------------------------------------------------------------
-- Заполнение
INSERT INTO author(author_name)
VALUES ('Окоти Итиро'),
       ('Цугуми Оба'),
       ('Тацуки Фудзимото'),
       ('Ода Эйитиро'),
       ('Хирому Аракава'),
       ('Ли Хаолин'),
       ('Хирохико Араки'),
       ('Ю Томофудзи'),
       ('ONE'),
       ('Хидеаки Анно');

INSERT INTO studio(studio_name)
VALUES ('Gainax'),
       ('Madhouse'),
       ('Bones'),
       ('David Production'),
       ('Toei Animation'),
       ('MAPPA'),
       ('LAN'),
       ('J.C. Staff'),
       ('Sunrise');

INSERT INTO anime(author_id, studio_id, title, status)
VALUES (9, 3, 'Моб Психо 100', 'ongoing'),
       (8, 8, 'Принесенная в жертву Прицесса и Царь зверей', 'announcement'),
       (1, 9, 'Код Гиас: Восстание Лелуша', 'completed'),
       (2, 2, 'Тетрадь Смерти', 'completed'),
       (6, 7, 'Агент Времени', 'announcement'),
       (4, 5, 'Ван-Пис', 'ongoing'),
       (3, 6, 'Человек-бензопила', 'ongoing'),
       (10, 1, 'Евангелион', 'completed'),
       (5, 3, 'Стальной алхимик', 'completed'),
       (7, 4, 'Невероятное Приключение ДжоДжо: Несокрушимый Алмаз', 'completed'),
       (7, 4, 'Невероятное Приключение ДжоДжо: Золотой Ветер', 'completed'),
       (7, 4, 'Невероятное Приключение ДжоДжо: Рыцари звездной пыли', 'completed'),
       (7, 4, 'Невероятное Приключение ДжоДжо', 'completed');

INSERT INTO genre(genre_name)
VALUES ('приключение'),
       ('комедия'),
       ('драма'),
       ('сёнен'),
       ('детектив'),
       ('исекай'),
       ('мистика'),
       ('фантастика'),
       ('повседневность'),
       ('сверхъестественное'),
       ('меха'),
       ('фэнтези'),
       ('романтика'),
       ('сёдзё'),
       ('ужасы'),
       ('трагедия'),
       ('экшен'),
       ('психологиеское'),
       ('спорт');

INSERT INTO genre(genre_name)
VALUES ('триллер');

INSERT INTO genre(genre_name)
VALUES ('криминал');

INSERT INTO genre(genre_name)
VALUES ('roadmovie');

INSERT INTO genre_anime(anime_id, genre_id)
VALUES (1, 2),
       (1, 4),
       (1, 10),
       (1, 17),
       (2, 2),
       (2, 9),
       (2, 12),
       (2, 13),
       (2, 14),
       (3, 1),
       (3, 3),
       (3, 4),
       (3, 8),
       (3, 11),
       (3, 16),
       (3, 18),
       (4, 3),
       (4, 5),
       (4, 7),
       (4, 16),
       (4, 18),
       (4, 20),
       (5, 3),
       (5, 2),
       (5, 5),
       (5, 10),
       (5, 9),
       (5, 18),
       (5, 20),
       (6, 1),
       (6, 2),
       (6, 3),
       (6, 4),
       (6, 12),
       (7, 2),
       (7, 3),
       (7, 4),
       (7, 5),
       (7, 7),
       (7, 17),
       (7, 20),
       (8, 20),
       (8, 18),
       (8, 16),
       (8, 11),
       (8, 10),
       (8, 3),
       (9, 1),
       (9, 2),
       (9, 3),
       (9, 4),
       (9, 5),
       (9, 7),
       (9, 20),
       (10, 1),
       (10, 2),
       (10, 3),
       (10, 5),
       (10, 7),
       (10, 9),
       (11, 1),
       (11, 3),
       (11, 7),
       (11, 21),
       (12, 1),
       (12, 2),
       (12, 3),
       (12, 7),
       (12, 22),
       (13, 1),
       (13, 2),
       (13, 3),
       (13, 4),
       (13, 7);

SELECT title, group_concat(genre_name, ", ")
FROM
    anime
INNER JOIN genre_anime ga on anime.anime_id = ga.anime_id
INNER JOIN genre g on g.genre_id = ga.genre_id
GROUP BY title;

SELECT title, author_name
FROM
    anime
    INNER JOIN author a on a.author_id = anime.author_id;
