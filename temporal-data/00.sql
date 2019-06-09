--
-- Runs in
--   - Oracle 18c
--
-- Does not run in
--   - PostgreSQL 11.3
--   - MS SQL 2017
--
create table reservation (
   guest       varchar(10)     not null,
   room_number integer         not null,
   checkin     date            not null,
   checkout    date            not null,
   period for stay (checkin, checkout)
);

--
-- Runs in
--   - PostgreSQL 11.3
--
create table reservation (
   guest       text            not null,
   room_number integer         not null,
   stay        daterange       not null
);

alter table reservation add primary key (room_number, stay);

create extension btree_gist;

alter table reservation add exclude using gist (room_number with =, stay with &&);

--
-- Does not run in
--   - Oracle 18 c
alter table reservation
add primary key (room_number, stay without overlaps);

insert into reservation values('Alice'  , 42, date '2019-04-03', date '2019-04-06');
insert into reservation values('Bob'    , 42, date '2019-04-06', date '2019-04-09');
--
-- Following should error
--
insert into reservation values('Charlie', 42, date '2019-04-08', date '2019-04-10');
