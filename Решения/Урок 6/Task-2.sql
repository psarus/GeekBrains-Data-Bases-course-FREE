USE shop;

-- Пересоздание таблицы catalogs.
DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255)
);

-- Пересоздание таблицы products.
DROP TABLE IF EXISTS products;
CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
    description TEXT,
    price DECIMAL(11, 2),
    catalog_id BIGINT UNSIGNED NOT NULL,
    FOREIGN KEY (catalog_id) REFERENCES  catalogs(id)
);

-- Заполениен данными таблицы catalogs.
INSERT INTO catalogs VALUES
	(1, 'Процессоры'),
    (2, 'Мат.платы'),
	(3, 'Видеокарты');

-- Заполнение данными таблицы products.
INSERT INTO products
  (name, description, price, catalog_id)
VALUES
  ('Intel Core i3-8100', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 7890.00, 1),
  ('Intel Core i5-7400', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 12700.00, 1),
  ('AMD FX-8320E', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 4780.00, 1),
  ('AMD FX-8320', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 7120.00, 1),
  ('ASUS ROG MAXIMUS X HERO', 'Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX', 19310.00, 2),
  ('Gigabyte H310M S2H', 'Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX', 4790.00, 2),
  ('MSI B250M GAMING PRO', 'Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX', 5060.00, 2);    

-- Создание представления
CREATE VIEW table_view AS
SELECT products.name product_name, catalogs.name catalog_name
FROM products
LEFT JOIN catalogs ON products.catalog_id = catalogs.id; 

-- Просмотр предсталения
SELECT * FROM table_view;
