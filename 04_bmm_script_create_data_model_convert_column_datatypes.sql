--Convert column datatypes
use db_business_model_mining;
Go

--Costs & Revenues
ALTER TABLE dbo.costs_revenues ALTER COLUMN account_date date;
GO
ALTER TABLE dbo.costs_revenues ALTER COLUMN account_value decimal(16,2);
GO

--Customers
ALTER TABLE dbo.customers ALTER COLUMN customer_registration_start date;
GO
ALTER TABLE dbo.customers ALTER COLUMN customer_registration_end date;
GO

--Event Log
ALTER TABLE dbo.event_log ALTER COLUMN execution_date date;
GO

--Partners
ALTER TABLE dbo.partners ALTER COLUMN partner_registration_start date;
GO
ALTER TABLE dbo.partners ALTER COLUMN partner_registration_end date;
GO

--Purchase Orders
ALTER TABLE dbo.purchases ALTER COLUMN purchase_order_date date;
GO
ALTER TABLE dbo.purchases ALTER COLUMN purchase_order_volume decimal(16,2);
GO
ALTER TABLE dbo.purchases ALTER COLUMN purchase_order_value decimal(16,2);
GO

--Resources
ALTER TABLE dbo.resources ALTER COLUMN resource_date date;
GO
ALTER TABLE dbo.resources ALTER COLUMN resource_value decimal(16,2);
GO

--Sales Orders
ALTER TABLE dbo.sales ALTER COLUMN sales_order_date date;
GO
ALTER TABLE dbo.sales ALTER COLUMN sales_order_volume decimal(16,2);
GO
ALTER TABLE dbo.sales ALTER COLUMN sales_order_value decimal(16,2);
GO