USE sample;

DROP TABLE IF EXISTS tbl1;
CREATE TABLE tbl1 (
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO tbl1 VALUES
	('2019-03-14'),
	('2019-11-30'),
	('2018-05-13'),
	('2017-09-10'),
	('2019-11-14'),
	('2018-03-01'),
	('2020-02-01'),
	('2018-03-06'),
	('2017-09-24'),
	('2018-09-03'),
	('2018-02-04'),
	('2018-03-15'),
	('2020-03-30'),
	('2018-09-01'),
	('2019-01-16'),
	('2019-04-23'),
	('2019-05-08'),
	('2019-08-27'),
	('2017-11-22'),
	('2019-03-10'),
	('2017-06-01'),
	('2018-05-20'),
	('2018-12-28'),
	('2019-07-19'),
	('2019-08-31'),
	('2017-06-27'),
	('2018-03-18'),
	('2019-03-31'),
	('2019-05-01');

-- Удалил с помощю временной таблицы
CREATE TEMPORARY TABLE temp(created_at DATETIME);
INSERT INTO temp SELECT created_at FROM tbl1
ORDER BY created_at DESC
LIMIT 5;
DELETE FROM tbl1
WHERE created_at NOT IN(SELECT created_at FROM temp);
DROP TABLE temp;

SELECT * FROM tbl1;
