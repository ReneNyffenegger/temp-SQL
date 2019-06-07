create table tq84_r (
   id      integer,
   col_r1  varchar(10),
   col_r2  varchar(10),
   col_r3  varchar(10)
);

create table tq84_l (
   id      integer,
   col_l1  varchar(10),
   col_l2  varchar(10),
   col_l3  varchar(10)
);

insert into tq84_r values (1, 'one'  , 'eins', 'uno');
insert into tq84_r values (2, 'two'  , 'zwei', 'due');
insert into tq84_r values (3, 'three', 'drei', 'tre');

insert into tq84_l values (1, 'a'   , 'b'   , 'c'   );
insert into tq84_l values (3, 'xxx' , 'yyy' , 'zzz' );
insert into tq84_l values (4, '....', '....', '....');
