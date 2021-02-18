-- 1-1
use bookrentalshop;
go

select lower(Email) as 'email'
     , Mobile as 'mobile'
	 , Names as 'names'
	 , Addr as 'addr'
  from membertbl
 order by names desc;


-- 1-2
use bookrentalshop;
go

select Names, Author, ReleaseDate, Price
  from bookstbl;

-- 2-1
use bookrentalshop;
go

select top(10)
       concat(right(Names, 2), ', ', left(Names, 1)) as '변경이름'
     , Levels
	 , left(Addr, 2) as '도시'
	 , lower(Email) as '이메일'
  from membertbl;


-- 2-2
use bookrentalshop;
go

select Idx
     , concat('제목 : ', Names) as 'Names'
	 , concat('저자 > ', Author) as 'Author'
	 , format(ReleaseDate, 'yyyy년 MM월 dd일') as '출판일'
	 , ISBN
	 , format(Price, '#,#원') as 가격
  from bookstbl
 order by Idx desc;


-- 3-1
use bookrentalshop;
go

select b.Idx as '번호'
     , b.Division as '장르번호'
	 , d.Names as '장르'
	 , b.Names as '책제목'
	 , b.Author as '저자'
  from bookstbl as b
 inner join divtbl as d
    on b.Division = d.Division
 where b.Division = 'B002'

-- 3-2
use bookrentalshop;
go

select m.Names
     , m.Levels
	 , m.Addr
	 , r.rentalDate
  from membertbl as m
 left outer join rentaltbl as r
    on m.Idx = r.memberIdx
 where r.rentalDate is null;


-- 4-1
use bookrentalshop;
go

insert into divtbl values ('I002', '자기계발서');


-- 4-2
use bookrentalshop;
go

update membertbl
   set Mobile = '010-6683-7732', Addr = '부산시 해운대구'
 where Idx = 26;


-- 5
use bookrentalshop;
go

select d.Names
     , sum(b.Price) as '총합계금액'
  from bookstbl as b
 inner join divtbl as d
    on b.Division = d.Division
 group by rollup(d.Names);