declare @year int; -- 연도 변수
set @year = 1980; -- 값 1980 대입

if @year >= 1980
begin
	select * from userTbl where birthYear >= @year;
end
else
begin
	print '검색을 할 수 없습니다.'
end