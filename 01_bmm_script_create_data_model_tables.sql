use db_business_model_mining;
Go

--Customer Master Data
Drop table if exists dbo.customers;
Go
Create Table dbo.customers (
	sub_company_id nvarchar(3) NOT NULL,
	customer_id nvarchar(18) NOT NULL,
	industry_id nvarchar(3) NOT NULL,
	customer_region_state_id nvarchar(3),
	customer_registration_start nvarchar(10) NOT NULL,
	customer_registration_end nvarchar(10),
	customer_active nvarchar(1) NOT NULL,
	customer_segment_id nvarchar(3) NOT NULL,
	customer_relationship_type_id nvarchar(3) NOT NULL,
	customer_need_id nvarchar(3),
	customer_behavior_id nvarchar(3),
	customer_attribute_id nvarchar(3),
	customer_communication_type_id nvarchar(3),
	customer_classification_id nvarchar(3),
	CONSTRAINT unique_FK_customer_id UNIQUE(customer_id),
);
Go

Drop table if exists dbo.lookup_customer_segments;
Go
Create Table dbo.lookup_customer_segments (
	customer_segment_id nvarchar(3) NOT NULL,
	customer_segment_description ntext,
	CONSTRAINT unique_FK_customer_segment_id UNIQUE(customer_segment_id)
);
Go

Drop table if exists dbo.lookup_customer_needs;
Go
Create Table dbo.lookup_customer_needs (
	customer_need_id nvarchar(3) NOT NULL,
	customer_need_description ntext,
	CONSTRAINT unique_FK_customer_need_id UNIQUE(customer_need_id)
);
Go

Drop table if exists dbo.lookup_customer_behaviors;
Go
Create Table dbo.lookup_customer_behaviors (
	customer_behavior_id nvarchar(3) NOT NULL,
	customer_behavior_description ntext,
	CONSTRAINT unique_FK_customer_behavior_id UNIQUE(customer_behavior_id)
);
Go

Drop table if exists dbo.lookup_customer_attributes;
Go
Create Table dbo.lookup_customer_attributes (
	customer_attribute_id nvarchar(3) NOT NULL,
	customer_attribute_description ntext,
	CONSTRAINT unique_FK_customer_attribute_id UNIQUE(customer_attribute_id)
);
Go

Drop table if exists dbo.lookup_customer_communication;
Go
Create Table dbo.lookup_customer_communication (
	customer_communication_type_id nvarchar(3) NOT NULL,
	customer_communication_type_description ntext,
	CONSTRAINT unique_FK_customer_communication_type_id UNIQUE(customer_communication_type_id)
);
Go

Drop table if exists dbo.lookup_customer_relationships;
Go
Create Table dbo.lookup_customer_relationships (
	customer_relationship_type_id nvarchar(3) NOT NULL,
	customer_relationship_type_description ntext,
	CONSTRAINT unique_FK_customer_relationship_type_id UNIQUE(customer_relationship_type_id)
);
Go

--Partners
Drop table if exists dbo.partners;
Go
Create Table dbo.partners (
	sub_company_id nvarchar(3) NOT NULL,
	partner_id nvarchar(18) NOT NULL,
	partner_description ntext NOT NULL,
	partner_registration_start nvarchar(10) NOT NULL,
	partner_registration_end nvarchar(10),
	partner_active nvarchar(1),
	industry_id nvarchar(3) NOT NULL,
	region_id nvarchar(3) NOT NULL,
	network_id nvarchar(3),
	CONSTRAINT unique_FK_partner_id UNIQUE(partner_id)
);
Go

Drop table if exists dbo.lookup_partner_regions;
Go
Create Table dbo.lookup_partner_regions (
	region_id nvarchar(3) NOT NULL,
	region_description ntext NOT NULL,
	CONSTRAINT unique_FK_region_id UNIQUE(region_id)
);
Go

Drop table if exists dbo.lookup_networks;
Go
Create Table dbo.lookup_networks (
	network_id nvarchar(3) NOT NULL,
	network_description ntext NOT NULL,
	CONSTRAINT unique_FK_network_id UNIQUE(network_id)
);
Go

--Materials Purchased
Drop table if exists dbo.purchases;
Go
Create Table dbo.purchases (
	sub_company_id nvarchar(3) NOT NULL,
	purchase_order_id nvarchar(18) NOT NULL,
	partner_id nvarchar(18) NOT NULL,
	purchase_order_date nvarchar(10) NOT NULL,
	material_id nvarchar(18) NOT NULL,
	purchase_order_volume nvarchar(18) NOT NULL,
	purchase_order_value nvarchar(18) NOT NULL,
	cost_type_id nvarchar(3) NOT NULL,
	CONSTRAINT unique_FK_purchase_order_id UNIQUE(purchase_order_id)
);
Go

--Purchasing master data
Drop table if exists dbo.lookup_materials;
Go
Create Table dbo.lookup_materials (
	sub_company_id nvarchar(3) NOT NULL,
	material_id nvarchar(18) NOT NULL,
	material_description_short nvarchar(50) NOT NULL,
	material_description_long ntext NOT NULL,
	material_group_id nvarchar(18) NOT NULL,
	cost_type_id nvarchar(3) NOT NULL
	CONSTRAINT unique_FK_material_id UNIQUE(material_id)
);
Go

Drop table if exists dbo.lookup_material_groups
Go
Create Table dbo.lookup_material_groups (
	material_group_id nvarchar(18) NOT NULL,
	material_group_description_short nvarchar(50) NOT NULL,
	material_group_description_long ntext NOT NULL,
	CONSTRAINT unique_FK_material_group_id UNIQUE(material_group_id)
);
Go

Drop table if exists dbo.lookup_cost_types;
Go
Create Table dbo.lookup_cost_types (
	cost_type_id nvarchar(3) NOT NULL,
	cost_type_description ntext NOT NULL,
	CONSTRAINT unique_FK_cost_type_id UNIQUE(cost_type_id)
);
Go

--Products Sold
Drop table if exists dbo.sales;
Go
Create Table dbo.sales (
	sub_company_id nvarchar(3) NOT NULL,
	sales_order_id nvarchar(18) NOT NULL,
	sales_order_date nvarchar(10) NOT NULL,
	product_id nvarchar(18) NOT NULL,
	customer_id nvarchar(18) NOT NULL,
	sales_order_volume nvarchar(18) NOT NULL,
	sales_order_value nvarchar(18) NOT NULL,
	sales_channel_id nvarchar(3) NOT NULL,
	revenue_type_id nvarchar(3) NOT NULL,
	CONSTRAINT unique_FK_sales_order_id UNIQUE(sales_order_id)
);
Go



Drop table if exists dbo.lookup_revenue_types;
Go
Create Table dbo.lookup_revenue_types (
	revenue_type_id nvarchar(3) NOT NULL,
	revenue_type_description ntext NOT NULL
	CONSTRAINT unique_FK_revenue_type_id UNIQUE(revenue_type_id)
);
Go

--Product master data
Drop table if exists dbo.lookup_products;
Go
Create Table dbo.lookup_products (
	sub_company_id nvarchar(3) NOT NULL,
	product_id nvarchar(18) NOT NULL,
	product_description_short nvarchar(50) NOT NULL,
	product_description_long ntext NOT NULL,
	product_group_id nvarchar(18) NOT NULL,
	CONSTRAINT unique_FK_product_id UNIQUE(product_id)
);
Go

Drop table if exists dbo.lookup_product_groups
Go
Create Table dbo.lookup_product_groups (
	product_group_id nvarchar(18) NOT NULL,
	product_group_description_short nvarchar(50) NOT NULL,
	product_group_description_long ntext NOT NULL,
	value_proposition_id nvarchar(3) NOT NULL
	CONSTRAINT unique_FK_product_group_id UNIQUE(product_group_id)
);
Go

Drop table if exists dbo.lookup_value_propositions
Go
Create Table dbo.lookup_value_propositions (
	sub_company_id nvarchar(3) NOT NULL,
	value_proposition_id nvarchar(3) NOT NULL,
	value_proposition_description_short nvarchar(50) NOT NULL,
	value_proposition_description_long ntext NOT NULL,
	CONSTRAINT unique_FK_value_proposition_id UNIQUE(value_proposition_id)
);
Go

--Lookup Industries
Drop table if exists dbo.lookup_industries;
Go
Create Table dbo.lookup_industries (
	sub_company_id nvarchar(3) NOT NULL,
	industry_id nvarchar(3) NOT NULL,
	industry_description_short nvarchar(50),
	industry_description_long ntext NOT NULL,
	CONSTRAINT unique_FK_industry_id UNIQUE(industry_id)
);
Go

--Customer Region
Drop table if exists dbo.lookup_customer_regions_countries;
Go
Create Table dbo.lookup_customer_regions_countries (
	customer_region_country_id nvarchar(3) NOT NULL,
	customer_region_country_description ntext,
	CONSTRAINT unique_FK_customer_region_country_id UNIQUE(customer_region_country_id)
);
Go

Drop table if exists dbo.lookup_customer_regions_states;
Go
Create Table dbo.lookup_customer_regions_states (
	customer_region_state_id nvarchar(3) NOT NULL,
	customer_region_description_state ntext,
	customer_region_country_id nvarchar(3),
	CONSTRAINT unique_FK_customer_region_state_id UNIQUE(customer_region_state_id)
);
Go

--Customer Classification
Drop table if exists dbo.lookup_customer_classifications;
Go
Create Table dbo.lookup_customer_classifications (
	sub_company_id nvarchar(3) NOT NULL,
	customer_classification_id nvarchar(3) NOT NULL,
	customer_classification_description ntext NOT NULL,
	CONSTRAINT unique_FK_customer_classification_id UNIQUE(customer_classification_id)
);
Go

--Sales Channels
Drop table if exists dbo.lookup_sales_channels;
Go
Create Table dbo.lookup_sales_channels (
	sub_company_id nvarchar(3) NOT NULL,
	sales_channel_id nvarchar(3) NOT NULL,
	sales_channel_description ntext NOT NULL,
	CONSTRAINT unique_FK_sales_channel_id UNIQUE(sales_channel_id)
);
Go

--Event Log for Key Activities
Drop table if exists dbo.event_log;
Go
Create Table dbo.event_log (
	sub_company_id nvarchar(3) NOT NULL,
	execution_date nvarchar(10) NOT NULL,
	transaction_id nvarchar(50) NOT NULL,
	username ntext
);
Go

Drop table if exists dbo.lookup_activities_transactions;
Go
Create Table dbo.lookup_activities_transactions (
	transaction_id nvarchar(50) NOT NULL,
	transaction_description ntext NOT NULL,
	CONSTRAINT unique_FK_transaction_description UNIQUE(transaction_id)
);
Go

Drop table if exists dbo.lookup_apqc_sub_processes;
Go
Create Table dbo.lookup_apqc_sub_processes (
	transaction_id nvarchar(50) NOT NULL,
	apqc_sub_process_id nvarchar(15) NOT NULL,
	apqc_sub_process_name ntext NOT NULL,
	apqc_process_id nvarchar(15) NOT NULL,
	CONSTRAINT unique_FK_apqc_sub_process_id UNIQUE(transaction_id)
);
Go

Drop table if exists dbo.lookup_apqc_processes;
Go
Create Table dbo.lookup_apqc_processes (
	apqc_process_id nvarchar(15) NOT NULL,
	apqc_process_name ntext NOT NULL,
	apqc_main_process_id nvarchar(15) NOT NULL,
	CONSTRAINT unique_FK_apqc_process_id UNIQUE(apqc_process_id)
);
Go

Drop table if exists dbo.lookup_apqc_main_processes;
Go
Create Table dbo.lookup_apqc_main_processes (
	apqc_main_process_id nvarchar(15) NOT NULL,
	apqc_main_process_name ntext NOT NULL,
	CONSTRAINT unique_FK_apqc_main_process_id UNIQUE(apqc_main_process_id)
);
Go

Drop table if exists dbo.lookup_apqc_functions;
Go
Create Table dbo.lookup_apqc_functions (
	apqc_function_id nvarchar(15) NOT NULL,
	apqc_function_name ntext NOT NULL,
	CONSTRAINT unique_FK_apqc_function_id UNIQUE(apqc_function_id)
);
Go

--Technical System and Company Information
Drop table if exists dbo.lookup_companies;
Go
Create Table dbo.lookup_companies (
	company_id nvarchar(3) NOT NULL,
	company_name ntext NOT NULL,
	CONSTRAINT unique_FK_company_id UNIQUE(company_id)
);
Go

Drop table if exists dbo.lookup_sub_companies;
Go
Create Table dbo.lookup_sub_companies (
	sub_company_id nvarchar(3) NOT NULL,
	sub_company_name ntext NOT NULL,
	company_id nvarchar(3) NOT NULL,
	CONSTRAINT unique_FK_sub_company_id UNIQUE(sub_company_id)
);
Go

--Balance Sheet Information
Drop table if exists dbo.cost_revenues;
Go
Create Table dbo.costs_revenues (
	sub_company_id nvarchar(3) NOT NULL,
	account_date nvarchar(10) NOT NULL,
	account_id nvarchar(10) NOT NULL,
	account_value nvarchar(18) NOT NULL,
);
Go

Drop table if exists dbo.lookup_accounts;
Go
Create Table dbo.lookup_accounts (
	sub_company_id nvarchar(3) NOT NULL,
	account_id nvarchar(10) NOT NULL,
	account_description nvarchar(100) NOT NULL,
	account_type_id nvarchar(15) NOT NULL,
	CONSTRAINT unique_FK_account_id UNIQUE(account_id)
);
Go

--Key Resources
Drop table if exists dbo.resources;
Go
Create Table dbo.resources (
	sub_company_id nvarchar(3) NOT NULL,
	account_id nvarchar(10) NOT NULL,
	resource_id nvarchar(15),
	resource_date nvarchar(10) NOT NULL,
	resource_value nvarchar(18) NOT NULL
);
Go

Drop table if exists dbo.lookup_resources;
Go
Create Table dbo.lookup_resources (
	sub_company_id nvarchar(3) NOT NULL,
	resource_id nvarchar(15) NOT NULL,
	resource_description ntext
	CONSTRAINT unique_FK_resource_id UNIQUE(resource_id)
);
Go

