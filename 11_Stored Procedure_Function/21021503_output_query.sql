USE [sqlDB]
GO
/****** Object:  StoredProcedure [dbo].[usp_users]    Script Date: 2021-02-15 오후 2:11:44 ******/
create or ALTER procedure usp_users4
	@txtValue nvarchar(20),
	@outValue int output -- 리턴받는 매개변수
as
	insert into testTBL values (@txtValue);
	select @outValue = IDENT_CURRENT('testTBL'); -- testTBL의 현재 identity값 리턴
go

-- exec usp_users '김경호';

-- exec usp_users2 1980, 180;

declare @pout int;
exec usp_users4 '테스트값 2', @pout output;

print concat('현재 입력된 값은 ==> ', @pout);
select @pout as '현재값';