use sqlDB;
go

create table indexTBL2 (
	a int not null unique,
	b int unique,
	c int not null unique,
	d int
);