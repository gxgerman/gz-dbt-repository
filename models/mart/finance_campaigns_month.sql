/*with month_costs as (
    select
        cd.date_date as date_date, 
        sum(cd.ads_cost) as total_ads_cost,
        fcd.total_sales_margin as ads_margin,
        average_basket
    from {{ ref('int_campaigns_day') }} as cd
    join {{ ref('finance_campaigns_day') }} as fcd
    on cd.date_date = fcd.date_date
    group by date_date, ads_margin, average_basket
)

select * from month_costs*/
select
    format_date('%Y-%m', date_date) as month,
    sum(ads_cost) as total_ads_cost,
    sum(ads_margin) as total_ads_margin,
    sum(average_basket) as average_basket
from {{ ref('finance_campaigns_day') }}
group by format_date('%Y-%m', date_date)





