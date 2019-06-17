create table some_data (
   val    decimal(5,2),
   txt    varchar(20)
);

insert into some_data values (1.27, 'Lorem'     );
insert into some_data values (0.87, 'ipsum'     );
insert into some_data values (3.79, 'dolor'     );
insert into some_data values (1.56, 'sit'       );
insert into some_data values (1.14, 'amet'      );
insert into some_data values (2.08, 'consetetur');
insert into some_data values (4.59, 'sadipscing');
insert into some_data values (3.38, 'elitr'     );
insert into some_data values (1.14, 'sed'       );
insert into some_data values (1.11, 'diam'      );
insert into some_data values (2.58, 'nonumy'    );
insert into some_data values (1.10, 'eirmod'    );
insert into some_data values (0.25, 'tempor'    );
insert into some_data values (1.91, 'invidunt'  );
insert into some_data values (4.24, 'ut'        );
insert into some_data values (2.35, 'labore'    );
insert into some_data values (1.83, 'et'        );
insert into some_data values (4.30, 'dolore'    );
insert into some_data values (1.96, 'magna'     );
insert into some_data values (4.53, 'aliquyam'  );
insert into some_data values (2.72, 'erat'      );
insert into some_data values (0.30, 'sed'       );
insert into some_data values (3.51, 'diam'      );
insert into some_data values (0.20, 'voluptu'   );
insert into some_data values (4.50, 'At'        );
insert into some_data values (1.92, 'vero'      );
insert into some_data values (0.96, 'eos'       );
insert into some_data values (2.20, 'et'        );
insert into some_data values (4.33, 'accusam'   );
insert into some_data values (3.82, 'et'        );
insert into some_data values (0.92, 'justo'     );
insert into some_data values (2.52, 'duo'       );
insert into some_data values (0.81, 'dolores'   );
insert into some_data values (1.40, 'et'        );
insert into some_data values (3.26, 'ea'        );
insert into some_data values (3.72, 'rebum'     );


select
   round(val, 0)                                         as val_,
   count(*)                                              as cnt,
   rpad('■', 11 * count(*) /
             max(count(*)) over ()
           ,
        '■')                                             as bar
from
   some_data
group by
   round(val, 0)
order by
   round(val, 0);
