use sqlDB;
go

select u.userID,
       u.userName,
       IIF(SUM(price * amount) is null, 0, SUM(price * amount)) as '총 구매금액',
	   case
	    when (SUM(price * amount) >= 1500) then 'VVIP'
		when (SUM(price * amount) >= 1000) then 'VIP'
		when (SUM(price * amount) >= 1) then 'Normal'
		else 'Ghost'
	   end as '고객레벨'
  from buyTbl as b
 right outer join userTbl as u
    on b.userID = u.userID
 group by u.userID, u.userName
 order by SUM(price * amount) desc;

select *
  from userTbl;