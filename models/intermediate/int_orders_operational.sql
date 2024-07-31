WITH sales_data_2 AS (
    SELECT
        date_date,
        m.orders_id,
        m.quantity,
        m.margin,
        m.revenue,
        CAST(sh.shipping_fee AS FLOAT64) AS shipping_fee,
        CAST(sh.logcost AS FLOAT64) AS log_cost,
        CAST(sh.ship_cost AS FLOAT64) AS ship_cost
    FROM {{ ref('int_orders_margin') }} AS m
    INNER JOIN {{ ref('stg_raw__ship') }} AS sh 
    ON m.orders_id = sh.orders_id
)

SELECT
    date_date,
    orders_id,
    quantity,
    margin,
    revenue,
    shipping_fee,
    log_cost,
    ship_cost,
    margin + shipping_fee - log_cost - ship_cost AS operational_margin
FROM sales_data_2

   


