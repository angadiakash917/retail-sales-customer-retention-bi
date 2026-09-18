# Power BI build guide

Import `data/raw/transactions.csv` as **Transactions**, set `order_date` to Date, and relate it to a Calendar table.

```DAX
Revenue = SUMX(Transactions, Transactions[quantity] * Transactions[unit_price] * (1 - Transactions[discount_rate]))
Cost = SUMX(Transactions, Transactions[quantity] * Transactions[unit_cost])
Profit = [Revenue] - [Cost]
Profit Margin = DIVIDE([Profit], [Revenue])
Orders = DISTINCTCOUNT(Transactions[order_id])
Customers = DISTINCTCOUNT(Transactions[customer_id])
Average Order Value = DIVIDE([Revenue], [Orders])
```

Create three report pages: **Executive overview** (KPI cards, monthly trend, category profit, slicers), **Promotion performance** (discount band vs. revenue/profit/margin), and **Customer retention** (import the final SQL RFM output, segment scatter plot, At Risk table).
