-- union
select clubName as bName, buildingNum as bLocation from ClubTbl
union
select stdName, region from StdTbl;

-- union all
select stdName, region from stdTbl
union all
select stdName, region from stdTbl;

-- except
select stdName, region from stdTbl
except
select stdName, region from stdTbl;

-- intersect
select userName, mobile1 + mobile2 as [전화번호] from userTbl
intersect
select userName, mobile1 + mobile2 from userTbl where mobile1 is null;