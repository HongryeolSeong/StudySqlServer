create or alter view uv_nonerentalMember
as
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
go