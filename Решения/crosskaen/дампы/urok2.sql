create database if not exists shop;
use shop;

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR (255),  -- Название раздела
  UNIQUE unique_name(name(10))
) COMMENT = 'Разделы интернет-магазина';


INSERT ignore INTO catalogs values
(DEFAULT, 'Processory'),
(DEFAULT, 'Mat_platy'),
(DEFAULT, 'Videokarty');


update catalogs set name = 'empty'
where name = 'NULL';


DROP TABLE IF EXISTS cat;
CREATE TABLE cat (
  id SERIAL PRIMARY KEY,
  name VARCHAR (255),  -- Название раздела
  UNIQUE unique_name(name(10))
) COMMENT = 'Разделы интернет-магазина';


insert into CAT select * from catalogs ;

-- select  * from cat;


DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR (255), /* Имя покупателя */
  birthday_at DATE, /*День Рождения покупателя */
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP, /* Дата регистрации пользователя */
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  /* Время последнего обновления записи пользователя обнов авто при вставки записи*/
) COMMENT = 'Покупатели';

INSERT INTO users (id, name, birthday_at) VALUES (1, 'HELLO', '1979-01-27');

DROP TABLE IF EXISTS products;
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR (255), /* Название товара */
  desription TEXT, /* Описание товара */
  price DECIMAL (11,2), /* Цена товара*/
  catalog_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
  KEY index_of_catalog_id (catalog_id)
) COMMENT = 'Товарные позиции';

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  id INT UNSIGNED NOT NULL PRIMARY KEY auto_increment,
  user_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP 
) COMMENT = 'Заказы';

DROP TABLE IF EXISTS orders_products;
CREATE TABLE orders_products (
  id INT UNSIGNED NOT NULL PRIMARY KEY auto_increment,
  order_id INT UNSIGNED,
  product_id INT UNSIGNED,
  total INT UNSIGNED DEFAULT 1, /* Количество заказанных товарных позиций */
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Состав (детали) заказа';

DROP TABLE IF EXISTS discounts;
CREATE TABLE discounts (
  id INT UNSIGNED PRIMARY KEY auto_increment,
  user_id INT UNSIGNED,
  product_id INT UNSIGNED,
  discount FLOAT UNSIGNED, /* Величина скидки от 0.0 до 1.0 */
  started_at DATETIME, /* Начало действия скидки (без ограничения по времени и NULL) */
  finished_at DATETIME, /* Конец действия скидки (если будет NULL = у интервала нет ограничения и скидка бессрочная !!!)*/
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP 
) COMMENT = 'Скидки';

DROP TABLE IF EXISTS storehouses;
CREATE TABLE storehouses (
  id INT UNSIGNED PRIMARY KEY auto_increment,
  name VARCHAR (255), /* Название склада */
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP 
) COMMENT = 'Склады';

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id INT UNSIGNED PRIMARY KEY auto_increment,
  storehouse_id INT UNSIGNED,
  product_id INT UNSIGNED,
  value INT UNSIGNED, /* Запас товарной позиции на складе */
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP 
) COMMENT = 'Запасы на складе';