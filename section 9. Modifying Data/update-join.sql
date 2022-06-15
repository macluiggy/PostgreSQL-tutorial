-- update join sirve para actulizar los datos de una tabla si existe un match con otra tabla
-- su sintaxis es:
UPDATE t1
SET t1.c1 = new_value
FROM t2
WHERE t1.c2 = t2.c2;

update product p set net_price = price - price*discount
from product_segment s
where p.segment_id = s.id;