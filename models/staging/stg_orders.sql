select
--from raw order
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
o.ordersellingprice - o.ordercostprice as orderprofit,
o.ordercostprice,
o.ordersellingprice,
--from raw customer
c.customerid,
c.customername,
c.segment,
c.country,
--from product
p.category,
p.productname,
p.subcategory,
p.productid
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_costumer') }} as c 
on o.customerid = c.customerid
left join {{ ref('raw_product') }} as p
on o.productid = p.productid