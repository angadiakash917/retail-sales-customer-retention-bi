/* SQL Server: run before importing data/raw/transactions.csv. */
CREATE TABLE dbo.retail_transactions (
    order_id VARCHAR(20) NOT NULL, order_date DATE NOT NULL, customer_id VARCHAR(20) NOT NULL,
    region VARCHAR(20) NOT NULL, channel VARCHAR(20) NOT NULL, category VARCHAR(30) NOT NULL,
    product VARCHAR(50) NOT NULL, quantity INT NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(12,2) NOT NULL CHECK (unit_price > 0),
    discount_rate DECIMAL(5,4) NOT NULL CHECK (discount_rate BETWEEN 0 AND 1),
    unit_cost DECIMAL(12,2) NOT NULL CHECK (unit_cost >= 0)
);
CREATE INDEX IX_retail_date ON dbo.retail_transactions(order_date);
CREATE INDEX IX_retail_customer ON dbo.retail_transactions(customer_id);
