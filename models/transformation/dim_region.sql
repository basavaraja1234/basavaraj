with raw_data as(
select 
distinct region
from {{ ref('stg_dmart') }}
)select 
row_number() over(order by region)as region_id,region
from raw_data