--***EXPLENOTARY DATA ANALYSIS (EDA)***
select distinct transaction_qty
from `workspace`.`default`.`1773680391797_bright_coffee_shop_analysis_case_study_1`
order by transaction_qty asc;




select count(DISTINCT transaction_id) AS total_orders,
      MIN(transaction_date) AS min_date,
      MAX(transaction_date) AS max_date,
      SUM(transaction_qty) AS total_units,
      SUM(unit_price * transaction_qty) AS total_revenue,
      AVG(unit_price) AS avg_price,
      MIN(transaction_time) AS min_time,
      MAX(transaction_time) AS max_time,
      COUNT(DISTINCT product_id)
from `workspace`.`default`.`1773680391797_bright_coffee_shop_analysis_case_study_1`
group by all;




--***Official Start of polishing data***
select transaction_id,
      transaction_date,
      transaction_time,
      transaction_qty,
      store_id,
      store_location,
      product_id,
      unit_price,
      product_category,
      product_type,
      product_detail,
      ---total revenue
      unit_price*transaction_qty AS total_amoumt,
      --Time bucket by 60 mins (hour number 0-23)
      date_part('hour', transaction_time) AS transaction_hour_bucket,
      --Time formatted as HH:MM:SS only
      date_format(transaction_time, 'HH:mm:ss') AS transaction_time_formatted,
      --day name and month name, day of month
      dayname(transaction_date) as Day_of_week,
      monthname(transaction_date) as Month_of_year,
      dayofmonth(transaction_date) as day_number,
      CASE
            when Day_of_week IN ('Sun','Sat') then 'Weekend'
            else 'Weekday'
            end as day_category,
      Case
            when transaction_hour_bucket BETWEEN 0 AND 6 THEN 'Early Morning'
            WHEN transaction_hour_bucket BETWEEN 7 AND 11 THEN 'Morning'
            WHEN transaction_hour_bucket BETWEEN 12 AND 16 THEN 'Afternoon'
            WHEN transaction_hour_bucket BETWEEN 17 AND 21 THEN 'Evening'
            WHEN transaction_hour_bucket BETWEEN 22 AND 23 THEN 'Night'
            ELSE 'Invalid'
            end as time_category,
      CASE 
            WHEN transaction_qty = 1 THEN 'Single'
            WHEN transaction_qty BETWEEN 2 AND 3 THEN 'Couple/Small Group'
            WHEN transaction_qty BETWEEN 4 AND 7 THEN 'Team'
            WHEN transaction_qty BETWEEN 8 AND 15 THEN 'Party'
            WHEN transaction_qty > 15 THEN 'Large Event'
            ELSE 'Unknown'
      END AS order_bucket
from `workspace`.`default`.`1773680391797_bright_coffee_shop_analysis_case_study_1`
;
