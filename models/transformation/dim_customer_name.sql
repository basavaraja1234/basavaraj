with raw_data as(
select 
distinct customer_name
from {{ ref('stg_dmart') }}
)select 
row_number() over(order by customer_name)as customer_id,customer_name
from raw_data