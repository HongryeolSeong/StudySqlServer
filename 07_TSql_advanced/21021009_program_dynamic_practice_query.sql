declare @curDate date;
declare @curYear varchar(4);
declare @curMonth varchar(2);
declare @curDay varchar(2);

declare @sql varchar(2000);

set @curDate = GETDATE();
set @curYear = YEAR(@curDate);
set @curMonth = MONTH(@curDate);
set @curDay = DAY(@curDate);

print @curYear;
print replicate('0', 2 - len(@curMonth)) + @curMonth; -- 한자리수 앞에 0붙이기
print right(('00' + @curMonth), 2); -- 한자리수 앞에 0붙이기
print @curDay;

print format(@curDate, 'yyyy-MM-dd');

set @sql = 'create table backup_' + format(@curDate, 'yyyy_MM_dd');
set @sql += ' (id int not null primary key, bName nvarchar(100) not null); ';
print @sql;
exec(@sql);