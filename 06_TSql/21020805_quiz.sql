use BikeStores;
go

select * from sales.customers
 where last_name like 'S%'
 and state like 'NY'
 and phone is not null
 order by first_name