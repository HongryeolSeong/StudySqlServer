use sqlDB;
go

declare @myVar1 int;
declare @myVar2 smallint, @myVar3 decimal(10, 6);
declare @myVar4 char(20);

set @myVar1 = 123748572;
set @myVar2 = 32000;
set @myVar3 = 3.141592;
set @myVar4 = '가수 이름==>   ';

select @myVar1 as 'int';
-- select @myVar2 + @myVar3 as 'smallint+decimal';
select '값은 ' + CAST(@myVar3 as varchar); -- CAST 활용
select @myVar4 as '항목', userName from userTbl where height >180;

declare @myVar5 tinyint; -- ~255
set @myVar5 = 3;
select top(@myVar5) userName, height from userTbl order by height desc;

select @@VERSION;


-- 시스템 함수
-- 형 변환함수
select CONVERT(float, amount) as amount from buyTbl;
select TRY_CONVERT(float, amount) as amount from buyTbl; -- 변환 실패시 null 출력
select AVG(convert(decimal(38, 20), amount)) as '평균구매개수' from buyTbl;

select price, amount, price/amount as [단가/수량] from buyTbl; -- [] 사용가능하지만 표준X

-- 문자열 변환함수
select PARSE('2021년 2월 2일' as date);
select TRY_PARSE('2021연 2월 39일' as date);

select PARSE('123.35' as float);
select TRY_PARSE('123.35' as decimal(5,2));

select CAST('11' as int);


-- 스칼라함수(단일 리턴함수)
select GETDATE() as '현재 날짜';

select year(GETDATE()) as '금년';
select month(GETDATE()) as '이번 달';
select day(GETDATE()) as '오늘일';
select ABS(-100);

select ROUND(3.14195, 3);
select ROUND(1234.5678, -1);

select CAST((RAND() * 100) as int);

select IIF(20 < 10, '참', '거짓');

-- 문자열 함수
select ASCII('a'), ASCII('A');
select CHAR(98), ASCII(68);
select UNICODE('가');
select NCHAR(45678);

-- 진짜 많이쓰이는 것
-- 문자열 결합 함수
select CONCAT('Microsoft ', 'SQL ', 'Server ', 2019);

-- 문자열 시작위치 리턴
select CHARINDEX('2019', 'SQL Server 2019');

-- left, right
select LEFT('SQL Server 2019', 3), RIGHT('SQL Server 2019', 4);

-- substring
select SUBSTRING('Hello, World!', 7, 7);
select SUBSTRING('안녕하세요, SQL 서버입니다!', 7, 7);

-- len
select LEN('안녕하세요'), LEN('Hello, World!');

-- lower, upper
select LOWER('abcdeFG'), UPPER('abcdeFG');

-- ltrim, rtrim
select LEN(LTRIM('   Hello World!   ')), 
       LEN(RTRIM('   Hello World!   ')), 
        LEN(TRIM('   Hello World!   '));

-- replace
select REPLACE('(2016년 발표) SQL Server 2016', '2016', '2019');

-- 정말X100 많이 쓰는 함수
select FORMAT(GETDATE(), ''); -- 기본
select FORMAT(GETDATE(), 'dd/MM/yyyy');
select FORMAT(GETDATE(), 'yyyy-MM-dd hh:mm:ss:ms');
select FORMAT(GETDATE(), 'yyyy-MM-dd hh:mm:ss:ms');
select FORMAT(GETDATE(), 'yyyy-MM-dd');
select FORMAT(GETDATE(), 'hh:mm:ss');
select GETDATE();