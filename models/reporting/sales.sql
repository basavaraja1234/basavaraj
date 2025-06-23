select 
{{ dbt_utils.generate_surrogate_key(['order_id', 'r.customer_name']) }}as order_date_id,
r.order_id,
du.customer_name,
d.category_id,
du.customer_id,
ci.city_id,
dr.region_id,
r.order_date,
r.sales,
r.profit,
r.discount
from {{ ref('stg_dmart') }} r
left join
{{ ref('dim_category') }} d 
on r.category=d.category
left join
{{ ref('dim_customer_name') }} du 
on r.customer_name=du.customer_name
left join
{{ ref('dim_city') }} ci 
on r.city=ci.city
left join
{{ ref('dim_region') }} dr 
on r.region=dr.region