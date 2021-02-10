/*
select * from StdTbl;
select * from ClubTbl;
select * from ClubRegTbl;
*/

-- Standard SQL
select s.id, s.stdName, c.clubName, c.buildingNum
  from StdTbl as s
 inner join ClubRegTbl as r
    on s.id = r.std_id
 inner join ClubTbl as c
    on r.club_id = c.id;


-- inner join 약식(SQL Server T-SQL)
select s.id, s.stdName, c.clubName, c.buildingNum
  from StdTbl as s, ClubRegTbl as r, ClubTbl as c
 where s.id = r.std_id
   and r.club_id = c.id;

-- outer join 
select s.id, s.stdName, c.clubName, c.buildingNum
  from StdTbl as s
  left outer join ClubRegTbl as r
    on s.id = r.std_id
  left outer join ClubTbl as c
    on r.club_id = c.id;

-- userTbl / buyTbl
select u.userName, u.addr, b.prodName, b.price
  from userTbl as u
 inner join buyTbl as b
    on u.userID = b.userID;

select u.userName, u.addr, b.prodName, b.price
  from userTbl as u
  left outer join buyTbl as b
    on u.userID = b.userID;

select u.userName, u.addr, b.prodName, b.price
  from userTbl as u
 right outer join buyTbl as b
    on u.userID = b.userID;

select u.userName, u.addr, b.prodName, b.price
  from userTbl as u
  full outer join buyTbl as b
    on u.userID = b.userID;

select * from buyTbl;