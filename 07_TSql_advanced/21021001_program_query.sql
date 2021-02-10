declare @var1 int; -- 변수 선언
set @var1 = 100; -- 변수 값 대입

if @var1 = 100
begin
	select '@var1이 100이다.'
end
else
begin
	select '@var1이 100이 아니다.'
end