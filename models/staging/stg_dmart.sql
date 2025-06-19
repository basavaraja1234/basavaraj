{{
    config(
        materialized='table'
    )
}}
select 
raw.order_id,
upper(raw.customer_name)as customer_name,
raw.category,
raw.sub_category,
raw.city,
coalesce(try_to_date(raw.order_date,'dd-mm-yyyy'),try_to_date(raw.order_date,'mm/dd/yyyy'))as order_date,
raw.region,
raw.sales,
raw.discount,
raw.profit,
raw.state,
raw.insert_date,
gst.gst_code
from 
{{ source('raw', 'dmart_raw') }} raw
left join
{{ ref('gst') }} gst
on raw.state = gst.state


