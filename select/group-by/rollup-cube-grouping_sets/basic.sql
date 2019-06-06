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

   
------------------------------
--                          --
--    Using three columns   --
--                          --
------------------------------
   
   
create table rr (
   v1  varchar(10),
   v2  varchar(10),
   v3  varchar(10),
   val integer
);

insert into rr values ('A', 'p', 'w', 1);
insert into rr values ('A', 'p', 'x', 3);
insert into rr values ('B', 'p', 'w', 1);
insert into rr values ('C', 'p', 'w', 1);



select
   v1,
   v2,
   v3,
   sum(val)
from
   rr
group by
   v1, v2,
   rollup(v3);   
