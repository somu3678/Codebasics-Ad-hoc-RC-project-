##### Generate a report which contains the top 5 customers who received an average high pre_invoice_discount_pct for the 
      fiscal year 2021 and in the Indian market. The final output contains these fields,
      --customer_code
      --customer
      --average_discount_percentage

SELECT
d_c.customer_code,
d_c.customer,
CONCAT(ROUND(AVG(f_pid.pre_invoice_discount_pct)*100.0,2),'%') AS average_discount_percentage
FROM dim_customer d_c
JOIN fact_pre_invoice_deductions f_pid ON d_c.customer_code = f_pid.customer_code   --------calculated average pre invoice discount percentage per each customer for top 5
WHERE f_pid.fiscal_year = 2021 AND d_c.market = 'India'
GROUP BY 1,2
ORDER BY f_pid.pre_invoice_discount_pct DESC
LIMIT 5
