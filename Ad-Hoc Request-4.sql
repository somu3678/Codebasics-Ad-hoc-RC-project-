
####  Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? The final output contains these fields,
----- segment
----- product_count_2020 
----- product_count_2021
----- difference

WITH prd_2020 AS
(SELECT
d_p.segment,
COUNT(DISTINCT f_gp.product_code) AS product_count_2020 
FROM dim_product d_p
JOIN fact_gross_price f_gp ON d_p.product_code = f_gp.product_code                -------calculated count of unique products in the year 2020
WHERE f_gp.fiscal_year = 2020
GROUP BY d_p.segment
),
prd_2021 AS
(
SELECT
d_p.segment,
COUNT(DISTINCT f_gp.product_code) AS product_count_2021
FROM dim_product d_p
JOIN fact_gross_price f_gp ON d_p.product_code = f_gp.product_code                -------calculated count of unique products in the year 2021
WHERE f_gp.fiscal_year = 2021
GROUP BY d_p.segment
)

SELECT
prd_2020.segment,
product_count_2020,
product_count_2021,
(product_count_2021 - product_count_2020) AS difference                            -------calculated difference between the two years products
FROM prd_2020
JOIN prd_2021 ON prd_2020.segment = prd_2021.segment
