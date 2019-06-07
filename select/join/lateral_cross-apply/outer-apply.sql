--
-- Use on Oracle, SQL Server
--
select
   r.col_r1,
   r.col_r2,
   r.col_r3,
   l.col_l1,
   l.col_l2,
   l.col_l3
from
   tq84_r r  
--   left join lateral
     outer apply
   (
                    select
                       id,
                       col_l1,
                       col_l2,
                       col_l3
                    from
                       tq84_l
                    where r.id = tq84_l.id
                 ) l
-- on
--   r.id = l.id
;

