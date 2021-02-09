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
select @myVar2 + @myVar3 as 'smallint+decimal';
select @myVar4 as '항목', userName from userTbl where height >180;

declare @myVar5 tinyint; -- ~255
set @myVar5 = 3;
select top(@myVar5) userName, height from userTbl order by height desc;