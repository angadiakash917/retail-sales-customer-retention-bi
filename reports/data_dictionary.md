# Data dictionary

## Raw transactions

| Field | Definition |
| --- | --- |
| `order_id` | Unique identifier for an order; an order can have multiple lines. |
| `order_date` | Date the order was placed. |
| `customer_id` | Anonymous customer identifier. |
| `region` | Customer sales region: North, South, East, or West. |
| `channel` | Sales channel: Online, Store, or Marketplace. |
| `category` / `product` | Merchandise hierarchy. |
| `quantity` | Units purchased on the order line. |
| `unit_price` | List price per unit in USD. |
| `discount_rate` | Fractional discount applied to the list price. |
| `unit_cost` | Estimated cost per unit in USD. |

## Derived metrics

| Field | Formula / definition |
| --- | --- |
| `gross_sales` | `quantity × unit_price` |
| `discount_amount` | `gross_sales × discount_rate` |
| `revenue` | `gross_sales − discount_amount` |
| `cost` | `quantity × unit_cost` |
| `profit` | `revenue − cost` |
| `profit_margin` | `profit ÷ revenue` |
| `recency_days` | Days since the customer's most recent purchase, calculated at the data snapshot date. |
| `frequency` | Number of distinct orders per customer. |
| `monetary_value` | Total customer revenue. |
| `segment` | RFM-derived audience for retention and marketing action. |
