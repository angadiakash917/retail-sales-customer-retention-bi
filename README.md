# Retail Sales and Customer Retention BI

An end-to-end portfolio project using **SQL, Excel, Power BI, Tableau, and statistics**. Northstar Retail uses fictional transactions to understand revenue drivers, discount impact, and customer-retention opportunities.

## Business questions

1. Which categories, regions, and channels create the most revenue and profit?
2. Do deeper discounts improve sales at an acceptable margin?
3. Which customers should be protected or reactivated?
4. Do online and store order values differ statistically?

## Skills demonstrated

| Skill | Portfolio evidence |
| --- | --- |
| SQL | Schema, KPI, discount, and RFM queries in `sql/` |
| Excel | Formula-driven workbook, charts, summaries, and statistical test setup |
| Power BI | Model, DAX measures, and report specification in `powerbi/` |
| Tableau | Calculated fields, sheets, and dashboard specification in `tableau/` |
| Statistics | Hypothesis-test methodology in `reports/statistical_analysis.md` |

## Structure

```
data/raw/transactions.csv        9,049 synthetic retail order lines
excel/retail_analytics.xlsx      Excel analysis workbook
sql/                             SQL Server scripts
powerbi/                         DAX measures and report layout
tableau/                         calculated fields and dashboard layout
reports/                         statistical analysis and findings
```

## Results

- $974,280 revenue and $435,638 profit from 6,000 orders.
- Champions are the highest-value RFM segment; prioritize loyalty treatment.
- Assess discounts above 20% on profit margin, not revenue alone.

## Use it

1. Import the CSV into SQL Server with `sql/01_create_table.sql`.
2. Run `sql/02_business_analysis.sql`.
3. Open the Excel workbook.
4. Connect Power BI or Tableau to the CSV and follow the matching guide.

## Resume bullet

> Built a retail sales and customer-retention BI project using SQL, Excel, Power BI, Tableau, and statistical analysis; analyzed 9,000+ transactions, designed KPI dashboards, segmented customers with RFM, and identified discount-margin tradeoffs to guide retention and promotion decisions.

The source data is synthetic and safe to publish. License: MIT.
