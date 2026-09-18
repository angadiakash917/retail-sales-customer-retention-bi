/* SQL Server KPI, profitability, discount, and RFM analysis. */
WITH sales AS (
 SELECT *, quantity * unit_price * (1 - discount_rate) revenue, quantity * unit_cost cost
 FROM dbo.retail_transactions
)
SELECT SUM(revenue) revenue, SUM(revenue-cost) profit,
 CAST(SUM(revenue-cost)/NULLIF(SUM(revenue),0) AS DECIMAL(8,4)) profit_margin,
 COUNT(DISTINCT order_id) orders, COUNT(DISTINCT customer_id) customers
FROM sales;

WITH sales AS (
 SELECT category, quantity * unit_price * (1 - discount_rate) revenue, quantity * unit_cost cost
 FROM dbo.retail_transactions
)
SELECT category, SUM(revenue) revenue, SUM(revenue-cost) profit,
 CAST(SUM(revenue-cost)/NULLIF(SUM(revenue),0) AS DECIMAL(8,4)) profit_margin
FROM sales GROUP BY category ORDER BY profit DESC;

WITH sales AS (
 SELECT *, quantity * unit_price * (1 - discount_rate) revenue, quantity * unit_cost cost FROM dbo.retail_transactions
), rfm AS (
 SELECT customer_id, DATEDIFF(DAY,MAX(order_date),DATEADD(DAY,1,(SELECT MAX(order_date) FROM sales))) recency_days,
 COUNT(DISTINCT order_id) frequency, SUM(revenue) monetary_value, SUM(revenue-cost) profit
 FROM sales GROUP BY customer_id
), scores AS (
 SELECT *, 6-NTILE(5) OVER(ORDER BY recency_days) r_score, NTILE(5) OVER(ORDER BY frequency) f_score,
 NTILE(5) OVER(ORDER BY monetary_value) m_score FROM rfm
)
SELECT *, CASE WHEN r_score>=4 AND f_score>=4 AND m_score>=4 THEN 'Champions'
 WHEN r_score<=2 AND f_score>=3 THEN 'At Risk' WHEN r_score>=4 AND f_score<=2 THEN 'New Customers'
 WHEN f_score>=3 OR m_score>=4 THEN 'Loyal' ELSE 'Potential Loyalists' END segment
FROM scores ORDER BY monetary_value DESC;

WITH sales AS (
 SELECT *, quantity * unit_price * (1 - discount_rate) revenue, quantity * unit_cost cost FROM dbo.retail_transactions
)
SELECT CASE WHEN discount_rate=0 THEN 'No discount' WHEN discount_rate<=.10 THEN '1-10%'
 WHEN discount_rate<=.20 THEN '11-20%' ELSE '20%+' END discount_band,
 SUM(revenue) revenue, SUM(revenue-cost) profit,
 CAST(SUM(revenue-cost)/NULLIF(SUM(revenue),0) AS DECIMAL(8,4)) profit_margin
FROM sales GROUP BY CASE WHEN discount_rate=0 THEN 'No discount' WHEN discount_rate<=.10 THEN '1-10%'
 WHEN discount_rate<=.20 THEN '11-20%' ELSE '20%+' END ORDER BY profit_margin DESC;
