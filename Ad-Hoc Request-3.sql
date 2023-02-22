
#### Provide a report with all the unique product counts for each segment and sort them in descending order of product counts.
#### The final output contains 2 fields,
    -- segment
    -- product_count
    
    
SELECT
segment,
COUNT(distinct product_code) AS product_count            ----Calculated unique products in each segment
FROM dim_product
GROUP BY segment
ORDER BY count(distinct product_code) DESC
