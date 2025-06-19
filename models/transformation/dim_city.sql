with raw_data as(
select 
distinct city,state
from {{ ref('stg_dmart') }}
)select 
row_number() over(order by city)as city_id,city,state
from raw_data