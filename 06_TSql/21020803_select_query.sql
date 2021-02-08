use sqlDB;
go

-- 이름이 김경호인 사람 조회
select * from userTbl
 where userName = '김경호';

 -- 1970년 이후 출생이고 키 182 이상인 사람의 아이디, 이름만 조회
select userID, userName
  from usertbl
 where birthYear >= 1970
   and height >= 182;

-- 1970년 이후 출생이거나 키 182 이상인 사람의 아이디, 이름만 조회
select userID, userName
  from usertbl
 where birthYear >= 1970
	or height >= 182;

-- 키가 180 ~ 183사이인 사람만 조회
select userID, userName, height
  from usertbl
 where height >= 180
   and height <= 183;

-- between ~ and
select userID, userName, height
  from usertbl
 where height between 180 and 183;

-- 지역이 경남 전남 경북인 사람
select userID, userName, addr
  from usertbl
 where addr = '경남'
	  or addr = '전남'
	  or addr = '경북';

select userID, userName, addr
  from usertbl
 where addr in ('경남', '전남', '경북');


-- like
select userID, userName, addr
  from usertbl
 where userName like '김%';

select userID, userName, addr
  from usertbl
 where userName like '_종신';


-- SUBQUERTY
select userName, height
  from userTbl
 where height > 177;

select userName, height
  from userTbl
 where height > 
       ( select height from userTbl where userName = '김경호' );


select userName, height
  from userTbl
 where height in -- and와 비슷
       ( select height from userTbl where addr = '경남' ); -- 170, 173


-- order by 정렬
select userName, mDate
  from userTbl
 order by mDate asc; -- asc 오름차순, desc 내림차순

select *
  from userTbl
 order by userID desc; -- asc 오름차순, desc 내림차순


-- distinct
select distinct addr
  from userTbl;

-- top
select top(5) *
  from userTbl
 order by mDate desc;

-- offset
select userID, userName, birthYear
  from userTbl
 order by birthYear
 offset 4 rows;


-- select into 복사
select * into buyTbl2 from buyTbl;
select userID, prodName into buyTbl3 from buyTbl;


-- group by
select * from buyTbl;

select userID, amount
  from buyTbl
 order by userID;

select userID, sum(amount) as '합계'
  from buyTbl
 group by userID;


 -- min, max
select min(height) as '작은키'
   from userTbl;

select max(height) as '큰키'
  from userTbl;

select userID, userName, min(height) as '작은키', max(height) as '큰키'
  from userTbl
 group by userID, userName;

 select userID, userName
   from userTbl
  where height = (select min(height) from userTbl)
     or height = (select max(height) from userTbl);

-- 총 데이터 개수
select count(*) as '회원수' from userTbl; -- 10
select count(*) as '구매내역수' from buyTbl; -- 12