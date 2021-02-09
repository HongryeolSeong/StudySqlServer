use sqlDB;
go

-- 순위 함수
select ROW_NUMBER() over(order by height desc, userName asc) as '키큰순위',
       userName, addr, height
  from userTbl;

select RANK() over(order by height desc) as '키큰순위',
       userName, addr, height
  from userTbl;

select DENSE_RANK() over(order by height desc) as '키큰순위',
       userName, addr, height
  from userTbl;

-- 많이쓰는 구문 over(partition by A order by B desc)
select RANK() over(partition by addr order by height desc) as '키큰순위',
       userName, addr, height
  from userTbl;