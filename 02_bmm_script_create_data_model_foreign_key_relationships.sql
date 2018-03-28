use db_business_model_mining;
Go

--Add foreign key relationships

--Customers
Alter table dbo.customers 
Add Foreign Key (sub_company_id) References dbo.lookup_sub_companies(sub_company_id)     
    on delete cascade
    on update cascade;
Go

Alter table dbo.customers 
Add Foreign Key (industry_id) References dbo.lookup_industries(industry_id)     
    on delete cascade
    on update cascade;
Go

Alter table dbo.customers 
Add Foreign Key (customer_region_state_id) References dbo.lookup_customer_regions_states(customer_region_state_id)     
    on delete cascade
    on update cascade;
Go

Alter table dbo.customers 
Add Foreign Key (customer_segment_id) References dbo.lookup_customer_segments(customer_segment_id)     
    on delete cascade
    on update cascade;
Go

Alter table dbo.customers 
Add Foreign Key (customer_relationship_type_id) References dbo.lookup_customer_relationships(customer_relationship_type_id)     
    on delete cascade
    on update cascade;
Go

Alter table dbo.customers 
Add Foreign Key (customer_need_id) References dbo.lookup_customer_needs(customer_need_id)     
    on delete cascade
    on update cascade;
Go

Alter table dbo.customers 
Add Foreign Key (customer_behavior_id) References dbo.lookup_customer_behaviors(customer_behavior_id)     
    on delete cascade
    on update cascade;
Go

Alter table dbo.customers 
Add Foreign Key (customer_attribute_id) References dbo.lookup_customer_attributes(customer_attribute_id)     
    on delete cascade
    on update cascade;
Go

Alter table dbo.customers 
Add Foreign Key (customer_communication_type_id) References dbo.lookup_customer_communication(customer_communication_type_id)     
    on delete cascade
    on update cascade;
Go

Alter table dbo.customers 
Add Foreign Key (customer_classification_id) References dbo.lookup_customer_classifications(customer_classification_id)     
    on delete cascade
    on update cascade;
Go

--Partners
Alter table dbo.partners
Add Foreign Key (sub_company_id) References dbo.lookup_sub_companies(sub_company_id)     
    on delete cascade
    on update cascade;
Go

Alter table dbo.partners
Add Foreign Key (industry_id) References dbo.lookup_industries(industry_id)     
    on delete cascade
    on update cascade;
Go

Alter table dbo.partners
Add Foreign Key (region_id) References dbo.lookup_partner_regions(region_id)     
    on delete cascade
    on update cascade;
Go

Alter table dbo.partners
Add Foreign Key (network_id) References dbo.lookup_networks(network_id)     
    on delete cascade
    on update cascade;
Go

--Materials Purchased
Alter table dbo.purchases
Add Foreign Key (sub_company_id) References dbo.lookup_sub_companies(sub_company_id)     
    on delete cascade
    on update cascade;
Go

Alter table dbo.purchases
Add Foreign Key (partner_id) References dbo.partners(partner_id)     
    on delete no action
    on update no action;
Go

Alter table dbo.purchases
Add Foreign Key (material_id) References dbo.lookup_materials(material_id)     
    on delete cascade
    on update cascade;
Go

Alter table dbo.purchases
Add Foreign Key (cost_type_id) References dbo.lookup_cost_types(cost_type_id)     
    on delete cascade
    on update cascade;
Go

--Purchasing master data
Alter table dbo.lookup_materials
Add Foreign Key (sub_company_id) References dbo.lookup_sub_companies(sub_company_id)     
    on delete no action
    on update no action;
Go

Alter table dbo.lookup_materials
Add Foreign Key (material_group_id) References dbo.lookup_material_groups(material_group_id)     
    on delete cascade
    on update cascade;
Go

Alter table dbo.lookup_materials
Add Foreign Key (cost_type_id) References dbo.lookup_cost_types(cost_type_id)     
    on delete no action
    on update no action;
Go

--Sales
Alter table dbo.sales
Add Foreign Key (sub_company_id) References dbo.lookup_sub_companies(sub_company_id)     
    on delete cascade
    on update cascade;
Go

Alter table dbo.sales
Add Foreign Key (product_id) References dbo.lookup_products(product_id)     
    on delete cascade
    on update cascade;
Go

Alter table dbo.sales
Add Foreign Key (sales_channel_id) References dbo.lookup_sales_channels(sales_channel_id)     
    on delete cascade
    on update cascade;
Go

Alter table dbo.sales
Add Foreign Key (revenue_type_id) References dbo.lookup_revenue_types(revenue_type_id)     
    on delete cascade
    on update cascade;
Go

--Product Master Data
Alter table dbo.lookup_products
Add Foreign Key (sub_company_id) References dbo.lookup_sub_companies(sub_company_id)     
    on delete no action
    on update no action;
Go

Alter table dbo.lookup_products
Add Foreign Key (product_group_id) References dbo.lookup_product_groups(product_group_id)     
    on delete cascade
    on update cascade;
Go

Alter table dbo.lookup_product_groups
Add Foreign Key (value_proposition_id) References dbo.lookup_value_propositions(value_proposition_id)     
    on delete cascade
    on update cascade;
Go

--Industries
Alter table dbo.lookup_industries
Add Foreign Key (sub_company_id) References dbo.lookup_sub_companies(sub_company_id)     
    on delete no action
    on update no action;
Go

--Customer Regions
Alter table dbo.lookup_customer_regions_states
Add Foreign Key (customer_region_country_id) References dbo.lookup_customer_regions_countries(customer_region_country_id)     
    on delete no action
    on update no action;
Go

--Customer Classifications
Alter table dbo.lookup_customer_classifications
Add Foreign Key (sub_company_id) References dbo.lookup_sub_companies(sub_company_id)     
    on delete no action
    on update no action;
Go

--Sales Channels
Alter table dbo.lookup_sales_channels
Add Foreign Key (sub_company_id) References dbo.lookup_sub_companies(sub_company_id)     
    on delete no action
    on update no action;
Go

--Event Log
Alter table dbo.event_log
Add Foreign Key (sub_company_id) References dbo.lookup_sub_companies(sub_company_id)     
    on delete cascade
    on update cascade;
Go

Alter table dbo.event_log
Add Foreign Key (transaction_id) References dbo.lookup_activities_transactions(transaction_id)     
    on delete cascade
    on update cascade;
Go

--APQC-Matching
Alter table dbo.event_log
Add Foreign Key (transaction_id) References dbo.lookup_apqc_sub_processes(transaction_id)     
    on delete cascade
    on update cascade;
Go

Alter table dbo.lookup_apqc_sub_processes
Add Foreign Key (apqc_process_id) References dbo.lookup_apqc_processes(apqc_process_id)     
    on delete cascade
    on update cascade;
Go

Alter table dbo.lookup_apqc_processes
Add Foreign Key (apqc_main_process_id) References dbo.lookup_apqc_main_processes(apqc_main_process_id)     
    on delete cascade
    on update cascade;
Go

Alter table dbo.lookup_apqc_functions
Add Foreign Key (apqc_function_id) References dbo.lookup_apqc_functions(apqc_function_id)     
    on delete no action
    on update no action;
Go

--Companies
Alter table dbo.lookup_sub_companies
Add Foreign Key (company_id) References dbo.lookup_companies(company_id)     
    on delete cascade
    on update cascade;
Go

--Costs & Revenues
Alter table dbo.costs_revenues
Add Foreign Key (sub_company_id) References dbo.lookup_sub_companies(sub_company_id)     
    on delete cascade
    on update cascade;
Go

Alter table dbo.costs_revenues
Add Foreign Key (account_id) References dbo.lookup_accounts(account_id)     
    on delete cascade
    on update cascade;
Go


--Alter table dbo.lookup_account_types
--Add Foreign Key (sub_company_id) References dbo.lookup_sub_companies(sub_company_id)     
--    on delete no action
--    on update no action;
--Go

--Key Resources
Alter table dbo.resources
Add Foreign Key (sub_company_id) References dbo.lookup_sub_companies(sub_company_id)     
    on delete cascade
    on update cascade;
Go

Alter table dbo.resources
Add Foreign Key (account_id) References dbo.lookup_accounts(account_id)     
    on delete cascade
    on update cascade;
Go

Alter table dbo.resources
Add Foreign Key (resource_id) References dbo.lookup_resources(resource_id)     
    on delete no action
    on update no action;
Go