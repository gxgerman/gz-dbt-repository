WITH sales_data AS (
    SELECT
        date_date,
        s.orders_id,
        s.quantity,
        CAST(p.purchase_price AS FLOAT64) AS purchase_price,
        CAST(s.revenue AS FLOAT64) AS revenue
        
    FROM {{ ref('stg_raw__sales') }} AS s
    LEFT JOIN {{ ref('stg_raw__product') }} AS p
    ON s.products_id = p.products_id
)

SELECT
    date_date,
    orders_id,
    quantity,
    purchase_price,
    revenue,
    (quantity * purchase_price) AS purchase_cost,
    (revenue -  (quantity*purchase_price)) AS margin
FROM sales_data

