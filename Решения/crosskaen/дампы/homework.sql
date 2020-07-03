create database if not exists homework2;
use homework2;
/* ������������ �� shop � homework2, �.� ��� ��� ��������� � ����,
 � ��������� �� �� ����, ��� ������ �������� ������ ����� ��� ���������� ��,
 ��������, ���� ������ */

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR (255)
  
-- UNIQUE unique_name(name(10)) 

  /* ���� name �� ����� ���� ���������� (UNIQUE) ��� �������,
  ��� ��� ������ ����� ����������� ��������� NULL-��������.
  �������� NULL � ����� ������ � ������� ����� ���� ������
  � ������������ ����� (����������).
  � ������� �� ���� � ���, ��� � "name ����� ���������� ������ ������,
  ����������� �������� NULL", �.�. ��������� ����� �������� NULL. */
  
) COMMENT = '������� ��������-��������';

INSERT ignore INTO catalogs values
(DEFAULT, 'Processory'),
(DEFAULT, 'Mat_platy'),
(DEFAULT, 'NULL'),
(DEFAULT, 'NULL');

-- truncate table catalogs;

-- select * from catalogs; 
/* ������, ��� ���� id � name �������� ������ �������� , �.�. ������ */

-- DESC catalogs;
/* ������, ��� ���� name ����� �������� �������� NULL */

-- UPDATE catalogs SET name = 'empty' where name = 'null';

-- select * from catalogs;