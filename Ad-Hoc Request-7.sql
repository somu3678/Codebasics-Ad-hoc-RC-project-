##### Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month.
This analysis helps to get an idea of low and high-performing months and take strategic decisions.
The final report contains these columns:
--month
--year
--gross_sales_amount

SELECT
EXTRACT(MONTH FROM f_sm.date) AS month,
EXTRACT(YEAR FROM f_sm.date) AS year,
ROUND(SUM(f_sm.sold_quantity * f_gp.gross_price),2) AS gross_sales_amount         -------calculated gross sales amount for month,year
FROM fact_sales_monthly f_sm
JOIN fact_gross_price f_gp ON f_sm.product_code = f_gp.product_code
JOIN dim_customer d_c ON f_sm.customer_code = d_c.customer_code
WHERE d_c.customer = 'Atliq Exclusive'
GROUP BY 2,1
ORDER BY 2,1

