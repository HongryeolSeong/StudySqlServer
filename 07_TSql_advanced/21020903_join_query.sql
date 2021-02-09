select * from usertbl where userID like 'JYP';
select * from buyTbl where userID = 'jyp';

select * from buyTbl where userID = 'bbk';

-- inner join
select u.userName, u.addr,
       CONCAT(u.mobile1, '-', left(u.mobile2, 4), '-', right(u.mobile2, 4)) as mobile,
	   b.prodName, b.price, b.amount
  from buyTbl as b
 inner join userTbl as u
    on b.userID = u.userID
 -- where b.userID = 'JYP';