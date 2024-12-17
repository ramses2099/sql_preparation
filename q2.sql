-- Query 2 Derive desired output

-- Using the source and the target table, write a query to arrive at the output table as shown in below image.
-- Provide the solution without using subqueries.

create table if not exists source(
id int not null,
name varchar(10) not null
);

create table if not exists target(
id int not null,
name varchar(10) not null
);


insert into source(id, name)
values
(1,'A'),
(2,'B'),
(3,'C'),
(4,'D');


select * from  source;


insert into target(id, name)
values
(1,'A'),
(2,'B'),
(4,'X'),
(5,'F');


-- solution
select 
s.id, 'New in source'
from source s left join target t 
on s.id = t.id
where t.id is null
union all
select 
t.id, 'New in target'
from source s right join target t 
on s.id = t.id
where s.id is null
union all
select 
s.id, 'Mismatch' as comment 
from source s inner join target t 
on s.id = t.id and s.name != t.name  
