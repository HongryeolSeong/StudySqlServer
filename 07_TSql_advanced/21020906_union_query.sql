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