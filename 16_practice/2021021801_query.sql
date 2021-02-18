-- outer join 쿼리
select r.rentalidx
     --, r.memberIdx
	 , m.memberName
     --, r.bookIdx
	 --, b.cateIdx
	 , c.cateName
	 , b.bookName
	 , b.author
     , format(r.rentalDt, 'yyyy년MM월dd일') as '대여일'
     , format(r.returnDt, 'yyyy년MM월dd일') as '반납일'
     , dbo.ufn_getState(r.rentalState) as '대여상태'
  from rentalTBL as r
 right outer join memberTBL as m -- left : rentalTBL  right : memberTBL(부모)
    on r.memberIdx = m.memberIdx
  left outer join booksTBL as b -- left : rentalTBl + memberTBL(부모)  right : booksTBL
    on r.bookIdx = b.bookIdx
  left outer join cateTBL as c -- left : rentalTBL + memberTBL + booksTBL(부모)  right : cateTBL
    on b.cateIdx = c.cateIdx
 where r.rentalIdx is null;


-- 데이터 입력 insert
insert into booksTBL
(
	cateIdx,
	bookName,
	author,
	company,
	releaseDate,
	ISBN,
	price
) 
values 
(
	'N0002',
	'순수하지 않은 감각',
	'요안나',
	'로코코',
	'2019-10-02',
	'9791135445705',
	12500
);


-- 데이터 수정 update + tran
begin tran;

select *
  from booksTBL;

update booksTBL
   set descriptions = '부명그룹의 브레인이자 핵심 TF팀 리더, 강태욱 수석.'
     , regDate = '2021-02-18'
 where bookIdx = 18;
 
rollback;
commit;


-- 카테고리 입력 insert + tran
begin tran;

insert into cateTBL /*(cateIdx, cateName)*/ values ('I0001', '대화/협상'),
												   ('I0002', '성공/처세'),
												   ('I0003', '시간관리');

select * from cateTBL;

rollback;
commit;

delete from cateTBL where cateIdx = 'I0003';

delete from cateTBL where cateIdx in ('I0001', 'I0002');