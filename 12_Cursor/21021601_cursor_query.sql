use sqlDB;
go

declare cur_userTbl cursor global
    for select userName, height from userTbl;

open cur_userTbl;

declare @userName nchar(8); -- 회원 이름
declare @height smallint; -- 회원의 키를 담는 변수
declare @cnt int = 0; -- 회원수(읽은 행수)
declare @totalHeight int = 0; -- 회원 키의 합계 변수

FETCH NEXT from cur_userTbl into @userName, @height; -- 커서값 읽어서 @height 변수에 할당

-- 반복문 시작
while @@FETCH_STATUS = 0
begin
	set @cnt +=1;
	set @totalHeight += @height;
	print concat('회원 : ', @userName, ' 키 : ', @height);
	FETCH NEXT from cur_userTbl into @userName, @height;
end

print @totalHeight;
print @cnt;
print CONCAT('회원 키 평균 => ', @totalHeight / @cnt);

close cur_userTbl;
deallocate cur_userTbl;