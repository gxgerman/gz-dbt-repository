with total_campaign_cost as (
    select*
    from {{ref('int_campaigns')}}
)
select 
    date_date,
    sum(ads_cost) as ads_cost,
    sum(impression) as ads_impression,
    sum(click) as ads_clicks,
from total_campaign_cost
GROUP by date_date