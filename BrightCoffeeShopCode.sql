SELECT 
    transaction_id,
    product_type,
    transaction_qty,
    CAST(((REPLACE (unit_price, ',','.'))) AS DECIMAL(10,3)) AS casted_unit_price,
    unit_price*transaction_qty AS total_amount,
    store_location,
    product_category,
    product_detail,
    DATE_TRUNC( HOUR, transaction_time) AS transaction_time_bucket,     
    SUM(transaction_qty) AS total_qty,
    AVG(transaction_qty) AS avg_qty,

    CASE
        WHEN transaction_time BETWEEN ' 05:00:00' AND '11:59:59' THEN 'Morning'
        WHEN transaction_time BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
        WHEN transaction_time BETWEEN '17:00:00' AND '20:59:59' THEN 'Evening'
        END AS time_of_day

    
  
FROM
  "COFFEE"."PUBLIC"."SHOP"

  GROUP BY ALL
  
        
  ORDER BY total_qty DESC
  
  ;
