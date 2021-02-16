insert into xmlTbl values ('Hello World');

select * from xmlTbl;

insert into xmlTbl values ('<html><body><p>Sample HTML</p></body></html>');
insert into xmlTbl values ('<html><body><p>Sample HTML</html></body>'); -- html과는 달리 형식에 엄격한 xml