
#### Get the products that have the highest and lowest manufacturing costs.The final output should contain these fields,
  --product_code
  --product
  --manufacture_cost

SELECT
d_p.product_code,
d_p.product,
ROUND(f_mc.manufacturing_cost,2) AS manufacturing_cost
FROM dim_product d_p
JOIN fact_manufacturing_cost f_mc ON d_p.product_code = f_mc.product_code
WHERE f_mc.manufacturing_cost = (SELECT MAX(manufacturing_cost) FROM fact_manufacturing_cost)       --------finding max and min manufacturing cost of products.
	 OR f_mc.manufacturing_cost = (SELECT MIN(manufacturing_cost) FROM fact_manufacturing_cost) 
ORDER BY f_mc.manufacturing_cost DESC
