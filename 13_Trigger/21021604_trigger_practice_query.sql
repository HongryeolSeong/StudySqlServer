USE [sqlDB]
GO

UPDATE [dbo].[userTbl]
   SET [userName] = '관운장'
 WHERE [userID] = 'JKW';
GO

delete from userTbl
 where userID = 'JKW';