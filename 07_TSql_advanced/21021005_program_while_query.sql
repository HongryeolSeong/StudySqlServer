declare @i int, @hap bigint = 0;
set @i = 0;

while (@i <= 100)
begin
	if (@i %7 = 0) -- 7의 배수 라면
	begin
		print CONCAT('7의 배수, ', @i);
		set @i += 1;
		continue;
	end

	set @hap += @i;
	if  (@hap > 1000) break;
	set @i += 1;
end

print @hap;