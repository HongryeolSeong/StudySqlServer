create view uv_stdclubTbl
as
select s.id, s.stdName, c.clubName, c.buildingNum
  from StdTbl as s
 inner join ClubRegTbl as r
    on s.id = r.std_id
 inner join ClubTbl as c
    on r.club_id = c.id;
go

select * from uv_stdclubTbl;