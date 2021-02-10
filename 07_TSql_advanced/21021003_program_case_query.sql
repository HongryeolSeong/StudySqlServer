declare @point int, @credit char;
set @point = 99;

set @credit =
  case
    when (@point >= 90) then 'A'
	when (@point >= 80) then 'B'
	when (@point >= 70) then 'C'
	when (@point >= 60) then 'D'
	else 'f'
  end

print CONCAT('취득점수 ==> ', @point);
print CONCAT('학점 ==> ', @credit);