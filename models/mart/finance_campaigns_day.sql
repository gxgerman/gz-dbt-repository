with finance_data as (
  select
    c.date_date,
    c.ads_cost,
    f.operational_margin,
    f.total_sales_margin,
    f.average_basket
from {{ ref('int_campaigns_day') }} as c
join {{ ref('finance_days') }} as f 
using (date_date)
)

select*, operational_margin-ads_cost as ads_margin
from finance_data
order by date_date