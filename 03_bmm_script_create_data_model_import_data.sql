--Skript zum Massenimport aller *.csv-Dateien innerhalb eines Ordners
	-- To allow advanced options to be changed.  
	EXEC sp_configure 'show advanced options', 1;  
	GO  
	-- To update the currently configured value for advanced options.  
	RECONFIGURE;  
	GO  
	-- To enable the feature.  
	EXEC sp_configure 'xp_cmdshell', 1;  
	GO  
	-- To update the currently configured value for this feature.  
	RECONFIGURE;  
	GO  

	--Festlegen allgemeiner Variablen
	Declare @sub_company		varchar(20),
			@storage_drive		varchar(3),
			@input_path			varchar(255),
			@tblNames			varchar(255),
			@temp_table			varchar(255),
			@data_path			varchar(255),
			@data_table			varchar(255),
			@count				int,
			@i					int = 1,
			@database			varchar(255),
			@use_db_cmd			varchar(255)

	--Wertzuweisungen
	Set @sub_company = 'alpha'
	Set @database = 'db_business_model_mining'
	Set @storage_drive = 'C:'
	Set @data_path = 'data_business_model_mining'
	Set @use_db_cmd = 'use ' + @database

	--Use database
	exec(@use_db_cmd)

	--Verarbeitungsliste
	Declare @tableNames table(Id int identity,TableNames Varchar(100))
	Insert Into @tableNames Values
	('costs_revenues'),
	('customers'),
	('event_log'),
	('lookup_accounts'),
	('lookup_activities_transactions'),
	('lookup_apqc_functions'),
	('lookup_apqc_main_processes'),
	('lookup_apqc_processes'),
	('lookup_apqc_sub_processes'),
	('lookup_companies'),
	('lookup_cost_types'),
	('lookup_customer_attributes'),
	('lookup_customer_behaviors'),
	('lookup_customer_classifications'),
	('lookup_customer_communication'),
	('lookup_customer_needs'),
	('lookup_customer_regions_countries'),
	('lookup_customer_regions_states'),
	('lookup_customer_relationships'),
	('lookup_customer_segments'),
	('lookup_industries'),
	('lookup_material_groups'),
	('lookup_materials'),
	('lookup_networks'),
	('lookup_partner_regions'),
	('lookup_product_groups'),
	('lookup_products'),
	('lookup_resources'),
	('lookup_revenue_types'),
	('lookup_sales_channels'),
	('lookup_sub_companies'),
	('lookup_value_propositions'),
	('partners'),
	('purchases'),
	('resources'),
	('sales')

	Select @count = Count(*) from @tableNames
	
	--Einführen der Variablen für Import
	declare @filename varchar(255),
            @path     varchar(255),
            @sql      varchar(8000),
            @cmd      varchar(1000)

--Loop für jede Tabelle, welche in der Verarbeitungsliste steht
While(@i <=@count)
Begin
	
	Select @tblNames = TableNames from @tableNames Where Id = @i
	print @tblNames

	--Set input path
	Set	@input_path = @storage_drive + '\' + @data_path + '\' + @sub_company + '\' + @tblNames + '\'
	print @input_path

	print 'data_table:' + @tblNames
	
	--Wertzuweisungen der Variablen für den Import
    Set @path = @input_path
	print @path
    Set @cmd = 'dir ' + @input_path + '*.csv /b'

	--Anlegen der temporären Tabelle und der Daten-Tabelle aus structure-Tabelle, falls diese noch nicht existieren

	----Bereinigen aller Data-Tabellen
	--Declare @del_data_table_cmd varchar(max)
	--Set @del_data_table_cmd = 'DELETE from ' + @tblNames
	--exec(@del_data_table_cmd)
		
	--Löschen der bisherigen Processing List, falls noch vorhanden
	If (object_id('CSV_Files_Processing_List', 'U') is not null) drop table CSV_Files_Processing_List

		--Loop durch sämtliche *.csv-Dateien innerhalb eines Ordners
	
					--Aufbauen der Tabelle, welche die Dateien für den Loop enthält
					Create Table CSV_Files_Processing_List(Target_Path varchar(255),Target_File varchar(255))
	
					--Befüllen der Tabelle Processing_List:
					Insert into CSV_Files_Processing_List(Target_File)
					EXEC Master..xp_cmdShell @cmd
					UPDATE CSV_Files_Processing_List SET Target_Path = @input_path where Target_Path is null
	
					--Cursor Loop
					declare c1 cursor for select Target_Path,Target_File FROM CSV_Files_Processing_List where Target_File like '%.csv%'
					open c1
					fetch next from c1 into @path, @filename
					While @@fetch_status <> -1
					  begin
					  
					  --bulk insert won't take a variable name, so make a sql and execute it instead:
					   set @sql = 'BULK INSERT ' + @tblNames + ' FROM ''' + @path + @filename + ''' '
						   + '     WITH ( 
								   FIELDTERMINATOR = '';'', 
								   ROWTERMINATOR = ''\n'', 
								   FIRSTROW = 2,
								   ROWS_PER_BATCH = 1000,
								   CODEPAGE = ''65001''
								) '
					print @sql
					exec (@sql)

					  fetch next from c1 into @path,@filename
					  end
					close c1
					deallocate c1
	
					--Löschen der Processing-Liste
					drop table CSV_Files_Processing_List

					--Löschen der temporären Datentabelle (wird nur für den Importvorgang benötigt)
					Declare @cmd_remove_temp_table varchar(max)
					Set @cmd_remove_temp_table = 'drop table ' + @temp_table
					exec(@cmd_remove_temp_table)

	Set @i += 1
End