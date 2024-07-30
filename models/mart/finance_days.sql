

SELECT
    date_date,
    COUNT(orders_id) AS nb_transaction,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(SUM(revenue) / COUNT(orders_id),2) as average_basket,
    ROUND(SUM(margin),2) AS total_sales_margin,
    ROUND(SUM(operational_margin),2) AS operational_margin,
    
FROM
     {{ ref('int_orders_operational') }}
GROUP BY
    date_date



