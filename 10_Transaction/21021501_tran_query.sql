USE [sqlDB]
GO

BEGIN TRY
	BEGIN TRAN

	INSERT INTO [dbo].[userTbl]
			   ([userID]
			   ,[userName]
			   ,[birthYear]
			   ,[addr]
			   ,[mobile1]
			   ,[mobile2]
			   ,[height]
			   ,[mDate])
		 VALUES
			   ('GJY'
			   ,'권지용'
			   ,1988
			   ,'서울'
			   ,'010'
			   ,'98989898'
			   ,175
			   ,GETDATE())

	INSERT INTO [dbo].[buyTbl]
			   ([userID]
			   ,[prodName]
			   ,[groupName]
			   ,[price]
			   ,[amount])
		 VALUES
			   ('GJY'
			   ,'선글라스'
			   ,null
			   ,900000
			   ,1)

	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK
END CATCH

GO


