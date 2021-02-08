use sqlDB;
go

-- �̸��� ���ȣ�� ��� ��ȸ
select * from userTbl
 where userName = '���ȣ';

 -- 1970�� ���� ����̰� Ű 182 �̻��� ����� ���̵�, �̸��� ��ȸ
select userID, userName
  from usertbl
 where birthYear >= 1970
   and height >= 182;

-- 1970�� ���� ����̰ų� Ű 182 �̻��� ����� ���̵�, �̸��� ��ȸ
select userID, userName
  from usertbl
 where birthYear >= 1970
	or height >= 182;

-- Ű�� 180 ~ 183������ ����� ��ȸ
select userID, userName, height
  from usertbl
 where height >= 180
   and height <= 183;

-- between ~ and
select userID, userName, height
  from usertbl
 where height between 180 and 183;

-- ������ �泲 ���� ����� ���
select userID, userName, addr
  from usertbl
 where addr = '�泲'
	  or addr = '����'
	  or addr = '���';

select userID, userName, addr
  from usertbl
 where addr in ('�泲', '����', '���');


-- like
select userID, userName, addr
  from usertbl
 where userName like '��%';

select userID, userName, addr
  from usertbl
 where userName like '_����';


-- SUBQUERTY
select userName, height
  from userTbl
 where height > 177;

select userName, height
  from userTbl
 where height > 
       ( select height from userTbl where userName = '���ȣ' );


select userName, height
  from userTbl
 where height in -- and�� ���
       ( select height from userTbl where addr = '�泲' ); -- 170, 173


-- order by ����
select userName, mDate
  from userTbl
 order by mDate asc; -- asc ��������, desc ��������

select *
  from userTbl
 order by userID desc; -- asc ��������, desc ��������


-- distinct
select distinct addr
  from userTbl;

-- top
select top(5) *
  from userTbl
 order by mDate desc;

-- offset
select userID, userName, birthYear
  from userTbl
 order by birthYear
 offset 4 rows;


-- select into ����
select * into buyTbl2 from buyTbl;
select userID, prodName into buyTbl3 from buyTbl;


-- group by
select * from buyTbl;

select userID, amount
  from buyTbl
 order by userID;

select userID, sum(amount) as '�հ�'
  from buyTbl
 group by userID;


 -- min, max
select min(height) as '����Ű'
   from userTbl;

select max(height) as 'ūŰ'
  from userTbl;

select userID, userName, min(height) as '����Ű', max(height) as 'ūŰ'
  from userTbl
 group by userID, userName;

 select userID, userName
   from userTbl
  where height = (select min(height) from userTbl)
     or height = (select max(height) from userTbl);

-- �� ������ ����
select count(*) as 'ȸ����' from userTbl; -- 10
select count(*) as '���ų�����' from buyTbl; -- 12