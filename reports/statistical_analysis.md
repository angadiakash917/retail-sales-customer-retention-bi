# Statistical analysis

## Question

Do Online and Store orders have different average order values?

## Method

Aggregate lines to order level: `order revenue = sum(quantity × unit price × (1 − discount rate))`. Run a two-sided Welch two-sample t-test on Online versus Store order values at a 5% significance level.

- Null hypothesis: the mean order values are equal.
- Alternative: the means differ.
- Report the mean difference, 95% confidence interval, p-value, and Cohen's d.

In Excel, create an order-level PivotTable and use **Data Analysis → t-Test: Two-Sample Assuming Unequal Variances**. A p-value below 0.05 means the observed difference is statistically significant; use Cohen's d and the dollar difference to judge whether it is commercially meaningful.
