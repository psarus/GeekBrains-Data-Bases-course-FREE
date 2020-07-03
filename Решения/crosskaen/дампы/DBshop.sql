create database if not exists shop;
use shop;

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR (255),  -- �������� �������
  UNIQUE unique_name(name(10))
) COMMENT = '������� ��������-��������';


INSERT ignore INTO catalogs values
(DEFAULT, 'Processory'),
(DEFAULT, 'Mat_platy'),
(DEFAULT, 'Videokarty');


update catalogs set name = 'Processory (Intel)';
/*where name = 'Processory';*/


DROP TABLE IF EXISTS cat;
CREATE TABLE cat (
  id SERIAL PRIMARY KEY,
  name VARCHAR (255),  -- �������� �������
  UNIQUE unique_name(name(10))
) COMMENT = '������� ��������-��������';


insert into CAT select * from catalogs ;

select  * from cat;


DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR (255), /* ��� ���������� */
  birthday_at DATE, /*���� �������� ���������� */
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP, /* ���� ����������� ������������ */
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  /* ����� ���������� ���������� ������ ������������ ����� ���� ��� ������� ������*/
) COMMENT = '����������';

INSERT INTO users (id, name, birthday_at) VALUES (1, 'HELLO', '1979-01-27');

DROP TABLE IF EXISTS products;
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR (255), /* �������� ������ */
  desription TEXT, /* �������� ������ */
  price DECIMAL (11,2), /* ���� ������*/
  catalog_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
  KEY index_of_catalog_id (catalog_id)
) COMMENT = '�������� �������';

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  id INT UNSIGNED NOT NULL PRIMARY KEY auto_increment,
  user_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP 
) COMMENT = '������';

DROP TABLE IF EXISTS orders_products;
CREATE TABLE orders_products (
  id INT UNSIGNED NOT NULL PRIMARY KEY auto_increment,
  order_id INT UNSIGNED,
  product_id INT UNSIGNED,
  total INT UNSIGNED DEFAULT 1, /* ���������� ���������� �������� ������� */
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = '������ (������) ������';

DROP TABLE IF EXISTS discounts;
CREATE TABLE discounts (
  id INT UNSIGNED PRIMARY KEY auto_increment,
  user_id INT UNSIGNED,
  product_id INT UNSIGNED,
  discount FLOAT UNSIGNED, /* �������� ������ �� 0.0 �� 1.0 */
  started_at DATETIME, /* ������ �������� ������ (��� ����������� �� ������� � NULL) */
  finished_at DATETIME, /* ����� �������� ������ (���� ����� NULL = � ��������� ��� ����������� � ������ ���������� !!!)*/
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP 
) COMMENT = '������';

DROP TABLE IF EXISTS storehouses;
CREATE TABLE storehouses (
  id INT UNSIGNED PRIMARY KEY auto_increment,
  name VARCHAR (255), /* �������� ������ */
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP 
) COMMENT = '������';

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id INT UNSIGNED PRIMARY KEY auto_increment,
  storehouse_id INT UNSIGNED,
  product_id INT UNSIGNED,
  value INT UNSIGNED, /* ����� �������� ������� �� ������ */
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP 
) COMMENT = '������ �� ������';