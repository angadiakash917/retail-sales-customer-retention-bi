# Tableau build guide

Connect to `data/raw/transactions.csv`, set `order_date` as Date, then create:

```tableau
Revenue: [quantity] * [unit_price] * (1 - [discount_rate])
Profit: [Revenue] - ([quantity] * [unit_cost])
Profit Margin: SUM([Profit]) / SUM([Revenue])
Discount Band: IF [discount_rate]=0 THEN "No discount" ELSEIF [discount_rate]<=.10 THEN "1-10%" ELSEIF [discount_rate]<=.20 THEN "11-20%" ELSE "20%+" END
```

Build: monthly Revenue/Profit line chart, category profit bar chart colored by margin, discount trade-off chart, and regional revenue map. Combine them in an Executive Overview dashboard with Date, Region, and Channel filters applied to all sheets.
