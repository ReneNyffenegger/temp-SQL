# temp-SQL

Temporary SQL stuff

## TODO

### Pipelined DML

   create table o (
     id   integer,
     txt  varchar(10)
   );
   
   insert into o values (1, 'one'  );
   insert into o values (2, 'two'  );
   insert into o values (3, 'three');


   SELECT 
      changed.txt
   FROM new table (
      update o set txt = 'foo'
      where
         id > 1
   )
   AS changed

   
   SELECT 
     gone.txt
   FROM old table (
      DELETE FROM o
      WHERE
         id > 1
   )
   AS gone

