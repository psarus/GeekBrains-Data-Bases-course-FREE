-- Пересоздание таблицы sample.users
DROP TABLE IF EXISTS sample.users;
CREATE TABLE sample.users(
	id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);
-- Пересоздание таблицы shop.users
DROP TABLE IF EXISTS shop.users;
CREATE TABLE shop.users(
	id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);
-- Заполенние таблиц данными
INSERT INTO shop.users(id, name) VALUES
	(1, 'Иванов Антон'),
    (2, 'Гусев Максим');
INSERT INTO sample.users(id, name) VALUES
	(1, 'Антонов Трофим'),
    (2, 'Карпов Нестор');
 
-- Транзакция
START TRANSACTION;
INSERT INTO sample.users(name) SELECT name FROM shop.users WHERE shop.users.id = 1;
DELETE FROM shop.users WHERE shop.users.id = 1;
COMMIT;

-- Просмотр выполенной транзакции
SELECT * FROM sample.users;