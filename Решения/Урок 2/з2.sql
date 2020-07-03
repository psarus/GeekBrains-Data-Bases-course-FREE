create database if not exists db_files;

use db_files;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Наименование пользователя',
  UNIQUE unique_name(name(10))
) COMMENT = 'Пользователи';

DROP TABLE IF EXISTS files;
CREATE TABLE files (
  file_id SERIAL PRIMARY KEY,
  path varchar(255) COMMENT 'Путь к файлу',
  name VARCHAR(255) COMMENT 'Наименование',
  description varchar(500) COMMENT 'Описание файла',
  tags varchar(500) COMMENT 'Ключевые слова',
  type_id BIGINT UNSIGNED NOT NULL comment 'Тип файла',
  user_id BIGINT UNSIGNED NOT NULL COMMENT 'id владельца'
) COMMENT = 'Файлы';

DROP TABLE IF EXISTS type_files;
CREATE TABLE type_files (
  type_id SERIAL PRIMARY KEY,
  type_name VARCHAR(255) COMMENT 'Наименование'
) COMMENT = 'Типы файлов';