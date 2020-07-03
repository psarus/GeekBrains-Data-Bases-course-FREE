use shop;

/*
1. В базе данных shop и sample присутвуют одни и те же таблицы учебной базы данных. 
Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.
*/

insert into shop.users(id, name) values (1, 'testuser');

start transaction;
  insert into sample.users select * from shop.users where id=1;
  delete from shop.users where id=1;
commit;



/*
2. Создайте представление, которое выводит 
название (name) товарной позиции из таблицы products 
и соответствующее название (name) каталога из таблицы catalogs.
*/

create view task_two as
  select 
    products.name as "Product", 
    catalogs.name as "Catalog" 
  from products 
  join catalogs 
    on catalog_id = catalogs.id 
  order by catalogs.name;
 
select * from task_two;


/*
Пусть имеется таблица с календарным полем created_at.
В ней размещены разряженые календарные записи за август 2018 года 
'2018-08-01', '2016-08-04', '2018-08-16' и 2018-08-17. 
Составьте запрос, который выводит полный список дат за август, 
выставляя в соседнем поле значение 1, если дата присутствует в исходном таблице и 0, если она отсутствует.
*/


insert into users(name, created_at)
values ('name test 1', '2018-08-01'), ('name test 2', '2018-08-04'), ('name test 3', '2018-08-16'), ('name test 4', '2018-08-17');

-- https://stackoverflow.com/questions/2157282/generate-days-from-date-range
-- адовый запрос со стек оверфлова, который генерирует даты между двумя датами

select a.Date, 
case 
  when u.created_at is not null then '1'
  else '0'
end as 'Created in august 2018'
from (
    select curdate() - INTERVAL (a.a + (10 * b.a) + (100 * c.a) + (1000 * d.a) ) DAY as Date
    from (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) as a
    cross join (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) as b
    cross join (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) as c
    cross join (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) as d
) a
left join (select created_at from users) as u 
  on a.Date = u.created_at
where a.Date between '2018-08-01' and '2018-08-31'
order by Date asc;



/*
4. (по желанию) Пусть имеется любая таблица с календарным полем created_at. 
Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей.
*/

use sample;

drop table if exists sample.users;
create table sample.users as select * from shop.users;

-- до
select * from users order by created_at desc;

start transaction;
  select count(*) from users into @cunt;
  set @cunt := @cunt - 5;   -- не придумал как иначе, если надо оставить 5, то значит надо удалить все минус 5
  prepare prep from 'delete from users order by created_at asc limit ?';
  execute prep using @cunt;
commit;

-- после
select * from users order by created_at desc;



