

#### What is the percentage of unique product increase in 2021 vs. 2020? The final output contains these fields,
      --unique_products_2020 
      --unique_products_2021
	    --percentage_chg  ####
      
WITH unique_2020 AS (
SELECT
COUNT(DISTINCT f_gp.product_code) AS unique_products_2020
FROM dim_product d_p
JOIN fact_gross_price f_gp ON d_p.product_code = f_gp.product_code           //calculated unique products in 2020 from dim_product and fact_gross_price tables//
WHERE f_gp.fiscal_year = 2020
),
unique_2021 AS(
SELECT 
COUNT(DISTINCT f_gp.product_code) AS unique_products_2021
FROM dim_product d_p                                                         //calculated unique products in 2021 from dim_product and fact_gross_price tables//
JOIN fact_gross_price f_gp ON d_p.product_code = f_gp.product_code
WHERE f_gp.fiscal_year = 2021
)

SELECT
unique_products_2020,                                                         // calculated pecentage change between products in the years 2020 and 2021
unique_products_2021,
CONCAT(ROUND((unique_products_2021 - unique_products_2020) / unique_products_2020 * 100.0,2),'%') AS percentage_chg
FROM unique_2020,unique_2021;






