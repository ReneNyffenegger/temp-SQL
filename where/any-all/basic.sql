create table o (n varchar(5), v integer);

insert into o values ('a', 1);
insert into o values ('b', 2);
insert into o values ('c', 3);


create table i (n varchar(5), v integer);

insert into i values ('n', 3);
insert into i values ('m', 4);
insert into i values ('o', null);


select * from o where v = any(select v from i where v is not null);
select * from o where v = any(select v from i );
select * from o where v = any(select v from i where v > 1000);

select * from o where v = all(select v from i where v is not null);
select * from o where v = all(select v from i );
select * from o where v = all(select v from i where v > 1000);
