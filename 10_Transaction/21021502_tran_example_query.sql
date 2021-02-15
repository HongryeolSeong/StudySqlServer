use tempdb;
go

create table bankBook
	( uName nvarchar(10),
	  uMoney int,
			constraint CK_uMoney
			check (uMoney >= 0)
	);
go
insert into bankBook values (N'구매자', 1000);
insert into bankBook values (N'판매자', 0);


BEGIN TRY
	BEGIN TRAN
		update bankBook set uMoney = uMoney - 600 where uName = N'구매자';
		update bankbook set uMoney = uMoney + 600 where uName = N'판매자';
	COMMIT TRAN
END TRY
BEGIN CATCH
	ROLLBACK
END CATCH
select * from bankBook;