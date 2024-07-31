
with adwords as (
    select date_date, campaign_name, sum(ads_cost) as total_ads_cost from {{ ref('stg_raw__adwords') }}
    group by date_date, campaign_name
),
bing as (
    select date_date, campaign_name, sum(ads_cost) as total_ads_cost from {{ ref('stg_raw__bing') }}
    group by date_date, campaign_name
),
criteo as (
    select date_date, campaign_name, sum(ads_cost) as total_ads_cost from {{ ref('stg_raw__criteo') }}
    group by date_date, campaign_name
),
facebook as (
    select date_date, campaign_name, sum(ads_cost) as total_ads_cost from {{ ref('stg_raw__facebook') }}
    group by date_date, campaign_name
)

select * from {{ ref('stg_raw__adwords') }}
union all
select * from {{ ref('stg_raw__bing') }}
union all
select * from {{ ref('stg_raw__criteo') }}
union all
select * from {{ ref('stg_raw__facebook') }}