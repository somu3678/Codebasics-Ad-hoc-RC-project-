#### Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution? 
The final output contains these fields,
--channel
--gross_sales_mln
--percentage

WITH gross_sales AS (
SELECT
d_c.channel,
ROUND((SUM(f_sm.sold_quantity * f_gp.gross_price)/1000000),2) AS gross_sales_mln
FROM fact_sales_monthly f_sm
JOIN fact_gross_price f_gp ON f_sm.product_code = f_gp.product_code
JOIN dim_customer d_c ON f_sm.customer_code = d_c.customer_code
WHERE f_sm.fiscal_year = 2021
GROUP BY d_c.channel
ORDER BY SUM(f_sm.sold_quantity * f_gp.gross_price)/1000000 DESC
)

SELECT
channel,
gross_sales_mln,
CONCAT(ROUND(gross_sales_mln * 100.0 / sum(gross_sales_mln) OVER(),2),'%')  AS percentage
FROM gross_sales

