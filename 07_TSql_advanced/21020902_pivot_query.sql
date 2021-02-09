use sqlDB;
go

/*
create table pivotTBL
(
	userName nvarchar(10),
	season nvarchar(3),
	amount int
);

insert into pivotTBL values ('김범수', '겨울', 10),
							('윤종신', '여름', 15),
							('김범수', '가을', 25),
							('김범수', '봄', 3),
							('김범수', '봄', 37),
							('윤종신', '겨울', 40),
							('김범수', '여름', 14),
							('김범수', '겨울', 22),
							('윤종신', '여름', 64);
go
*/

select * from pivotTBL;

select * from pivotTBL
 pivot (sum(amount)
        for season
		in ([봄], [여름], [가을], [겨울])) as resultPivot;


-- JSON
select userID, userName, addr, height
  from userTbl
 where height >= 180
   for json auto;