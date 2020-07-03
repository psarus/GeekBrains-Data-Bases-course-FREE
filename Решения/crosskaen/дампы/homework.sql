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

INSERT ignore INTO catalogs values
(DEFAULT, 'Processory'),
(DEFAULT, 'Mat_platy'),
(DEFAULT, 'NULL'),
(DEFAULT, 'NULL');

-- truncate table catalogs;

-- select * from catalogs; 
/* Увидим, что поля id и name содержат пустые значения , т.е. ничего */

-- DESC catalogs;
/* Увидим, что поле name может содержат значения NULL */

-- UPDATE catalogs SET name = 'empty' where name = 'null';

-- select * from catalogs;