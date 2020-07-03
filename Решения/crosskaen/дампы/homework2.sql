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

select * from catalogs; -- �����, ��� ������� ������, �� ���� � name ����� �� ���� �����

DESC catalogs; -- �����, ��� name ����� ��������� NULL-��������

INSERT ignore INTO catalogs values
(DEFAULT, 'Processory'),
(DEFAULT, 'Mat_platy'),
(DEFAULT, 'NULL'),
(DEFAULT, 'NULL');

/* ������� 4 �������, 2 �� ������� (� ID = 3 � ID =4) ����� ��������� NULL-�������� */

 select * from catalogs; -- ������ NULL-�������� ������

UPDATE catalogs SET name = 'empty' where name = 'null';

/* ������, ������� �������� ��� ���� � NULL �� ������ 'empty' */

select * from catalogs; -- ������ EMPTY-�������� ������