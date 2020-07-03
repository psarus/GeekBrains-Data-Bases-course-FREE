create database if not exists homework2;
use homework2;
/* переименовал БД shop в homework2, т.к она уже существут в СУБД,
 а обновлять ее не хочу, для своего удобства создал новую для выполнения ДЗ,
 простите, люди добрые */

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR (255)
  
-- UNIQUE unique_name(name(10)) 

  /* ПОЛЕ name НЕ МОЖЕТ БЫТЬ УНИКАЛЬНЫМ (UNIQUE) ПРИ УСЛОВИИ,
  ЧТО ОНО ДОЛЖНО ИМЕТЬ ВОЗМОЖНОСТЬ ПРИНИМАТЬ NULL-ЗНАЧЕНИЯ.
  ЗНАЧЕНИЕ NULL В ТАКОМ СЛУЧАЕ В ТАБЛИЦЕ МОЖЕТ БЫТЬ ТОЛЬКО
  В ЕДИНСТВЕННОМ ЧИСЛЕ (УНИКАЛЬНОЕ).
  В ЗАДАНИИ ЖЕ РЕЧЬ О ТОМ, ЧТО В "name могут находиться пустые строки,
  принимающИЕ значение NULL", т.е. ДОПУСТИМО МНОГО ЗНАЧЕНИЙ NULL. */
  
) COMMENT = 'Разделы интернет-магазина';

select * from catalogs; -- ВИДИМ, ЧТО ТАБЛИЦА ПУСТАЯ, ТО ЕСТЬ В name МОЖЕТ НЕ БЫТЬ СТРОК

DESC catalogs; -- ВИДИМ, ЧТО name МОЖЕТ СОДЕРЖАТЬ NULL-значения

INSERT ignore INTO catalogs values
(DEFAULT, 'Processory'),
(DEFAULT, 'Mat_platy'),
(DEFAULT, 'NULL'),
(DEFAULT, 'NULL');

/* ВСТАВИМ 4 СТРОЧКИ, 2 ИЗ КОТОРЫХ (С ID = 3 И ID =4) МОГУТ СОДЕРЖАТЬ NULL-значения */

 select * from catalogs; -- УВИДИМ NULL-значения ВООЧИЮ

UPDATE catalogs SET name = 'empty' where name = 'null';

/* ЗАПРОС, КОТОРЫЙ ЗАМЕНЯЕТ ВСЕ ПОЛЯ С NULL НА СТРОКУ 'empty' */

select * from catalogs; -- УВИДИМ EMPTY-значения ВООЧИЮ