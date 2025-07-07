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
  
FROM
  "COFFEE"."PUBLIC"."SHOP"

  GROUP BY ALL;
  
           
           transaction_time_bucket
  ORDER BY total_qty DESC
  
  ;


  SELECT transaction_id ,
        transaction_qty,
    CAST(((REPLACE (unit_price, ',','.'))) AS DECIMAL(10,3)) AS casted_unit_price,

    unit_price*transaction_qty AS total_amount
    
    FROM "COFFEE"."PUBLIC"."SHOP";

    
        
