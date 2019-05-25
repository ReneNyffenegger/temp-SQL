create table r (t1 varchar(3), t2 varchar(3), val integer);

insert into r values ('a', 'x', 1);
insert into r values ('a', 'y', 2);
insert into r values ('a', 'y', 3);

insert into r values ('b', 'y', 4);
insert into r values ('b', 'z', 5);

select
   t1, t2, sum(val)
from
   r
group by
   t1, t2;
   
   
select
   t1, t2, sum(val)
from
   r
group by rollup 
   (t1, t2);
   
select
   t1, t2, sum(val)
from
   r
group by cube 
   (t1, t2);
   
   
select
   t1, t2, sum(val)
from
   r
group by grouping sets ( 
 --  (t1, t2),
   (t1    ),
   (    t2),
 --  
