use sqlDB;
go

-- 사용자 정의 함수없이 실행
select
		*,
		(year(getdate()) - birthYear) + 1 as 나이
  from userTbl;
go

-- 사용자 정의 함수 만든뒤 실행
create or alter function ufn_getAge
(@birthYear int)
returns int
as
begin
	declare @age int;
	set @age = year(getdate()) - @birthYear + 1;
	return @age;
end
go

select *,
       dbo.ufn_getAge(birthYear) as 나이
  from userTbl;