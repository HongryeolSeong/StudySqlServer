use sqlDB;
go

create or alter procedure usp_ifElse
	@userName nvarchar(10)
as
	declare @birthYear int; -- 출생년도 저장 변수
	select @birthYear = birthYear -- userTbl의 birthYear 사용 위해
	  from userTbl
	 where userName = @userName;

	if (@birthYear >= 1980)
	begin
		print '아직 젊군요..';
	end
	else
	begin
		print '나이가 지긋하시네요..';
	end
go

exec usp_ifElse '이승기';