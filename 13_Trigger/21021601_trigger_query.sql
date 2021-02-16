use sqlDB;
go

create or alter trigger trg_testtbl
on testtbl
after insert, delete, update -- 삭제, 수정할 때 트리거 발생
as
	print '새 트리거 발생';

insert into testTBL values ('트와이스');
select * from testTBL where txt = 'BTS';
update testTBL set txt = '마마무뉴!' where id = 8;
delete testTBL where id = 3;