### Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021? 
The final output contains these fields,
--division
--product_code
--product
--total_sold_quantity
--rank_order


WITH cte AS (
  SELECT
    d_p.division,
    d_p.product_code,
    d_p.product,
    SUM(f_sm.sold_quantity) AS total_sold_quantity,
    RANK() OVER (PARTITION BY d_p.division ORDER BY SUM(f_sm.sold_quantity) DESC) AS rank_order
  FROM dim_product d_p
  INNER JOIN fact_sales_monthly f_sm ON d_p.product_code = f_sm.product_code AND f_sm.fiscal_year = 2021
  GROUP BY d_p.division, d_p.product_code, d_p.product
)
SELECT
  division,
  product_code,
  product,
  total_sold_quantity,
  rank_order
FROM cte
WHERE rank_order <= 3
