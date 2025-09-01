create or alter procedure bronze.load_bronze as
begin
declare @start_time datetime, @end_time datetime, @batch_start_time datetime, @batch_end_time datetime;
begin try
set @batch_start_time = GETDATE();
print '==================================================================='
print 'Loading Bronze Layer'
print '==================================================================='
print '-------------------------------------------------------------------'
print 'Loading CRM tables'
print '-------------------------------------------------------------------'

set @start_time = GETDATE();
print '>> Truncating Table: bronze.crm_cust_info'
truncate table bronze.crm_cust_info; 

print '>> Inserting data into table: bronze.crm_cust_info'
bulk insert bronze.crm_cust_info
from 'C:\Users\vasua\OneDrive\Desktop\DATA ANALYTICS\PROJECTS - DATA ANALYTICS\MEGA PROJECT (1) - SQL DATA WAREHOUSE\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
with (
firstrow = 2,
fieldterminator = ',',
tablock);

select * from bronze.crm_cust_info;
select count(*) from bronze.crm_cust_info;

set @end_time= GETDATE();
print'>>Load Duration: ' + cast(datediff(second,@start_time,@end_time) as nvarchar) + 'seconds';
print'----------------------------------------'

set @start_time = GETDATE();
print 'Truncating table: bronze.crm_prd_info'
truncate table bronze.crm_prd_info; 
print 'Inserting data into table: bronze.crm_prd_info'
bulk insert bronze.crm_prd_info
from 'C:\Users\vasua\OneDrive\Desktop\DATA ANALYTICS\PROJECTS - DATA ANALYTICS\MEGA PROJECT (1) - SQL DATA WAREHOUSE\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
with (
firstrow = 2,
fieldterminator = ',',
tablock);
select * from bronze.crm_prd_info;
select count(*) from bronze.crm_prd_info;
set @end_time = getdate();
print'>>Load Duration: ' + cast(datediff(second,@start_time,@end_time) as nvarchar) + 'seconds';
print'----------------------------------------'


set @start_time = GETDATE();
print 'Truncating Table : bronze.crm_sales_details'
truncate table bronze.crm_sales_details; 
print 'Inserting data into table: bronze.crm_sales_details'
bulk insert bronze.crm_sales_details
from 'C:\Users\vasua\OneDrive\Desktop\DATA ANALYTICS\PROJECTS - DATA ANALYTICS\MEGA PROJECT (1) - SQL DATA WAREHOUSE\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
with (
firstrow = 2,
fieldterminator = ',',
tablock);
select * from bronze.crm_sales_details;
select count(*) from bronze.crm_sales_details;
set @end_time = getdate();
print'>>Load Duration: ' + cast(datediff(second,@start_time,@end_time) as nvarchar) + 'seconds';
print'----------------------------------------'

print '-------------------------------------------------------------------'
print 'Loading ERP tables'
print '-------------------------------------------------------------------'

set @start_time = GETDATE();
print'Truncating table: bronze.erp_cust_az12'
truncate table bronze.erp_cust_az12; 
print 'Inserting data into table: bronze.erp_cust_az12'
bulk insert bronze.erp_cust_az12
from 'C:\Users\vasua\OneDrive\Desktop\DATA ANALYTICS\PROJECTS - DATA ANALYTICS\MEGA PROJECT (1) - SQL DATA WAREHOUSE\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
with (
firstrow = 2,
fieldterminator = ',',
tablock);
select * from bronze.erp_cust_az12;
select count(*) from bronze.erp_cust_az12;
set @end_time = getdate();
print'>>Load Duration: ' + cast(datediff(second,@start_time,@end_time) as nvarchar) + 'seconds';
print'----------------------------------------'


set @start_time = GETDATE();
print 'Truncating table:  bronze.erp_loc_a101'
truncate table bronze.erp_loc_a101; 
print 'Inserting data into the table: bronze.erp_loc_a101'
bulk insert bronze.erp_loc_a101
from 'C:\Users\vasua\OneDrive\Desktop\DATA ANALYTICS\PROJECTS - DATA ANALYTICS\MEGA PROJECT (1) - SQL DATA WAREHOUSE\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
with (
firstrow = 2,
fieldterminator = ',',
tablock);
select * from bronze.erp_loc_a101;
select count(*) from bronze.erp_loc_a101;
set @end_time = getdate();
print'>>Load Duration: ' + cast(datediff(second,@start_time,@end_time) as nvarchar) + 'seconds';
print'----------------------------------------'


set @start_time = GETDATE();
print 'Truncating table: bronze.erp_px_cat_g1v2'
truncate table bronze.erp_px_cat_g1v2; 
print 'Inserting data into table: bronze.erp_px_cat_g1v2'
bulk insert bronze.erp_px_cat_g1v2
from 'C:\Users\vasua\OneDrive\Desktop\DATA ANALYTICS\PROJECTS - DATA ANALYTICS\MEGA PROJECT (1) - SQL DATA WAREHOUSE\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
with (
firstrow = 2,
fieldterminator = ',',
tablock);
select * from bronze.erp_px_cat_g1v2;
select count(*) from bronze.erp_px_cat_g1v2;
set @end_time = getdate();
print'>>Load Duration: ' + cast(datediff(second,@start_time,@end_time) as nvarchar) + 'seconds';
print'----------------------------------------'

set @batch_end_time = GETDATE();
print '============================================================'
print 'Bronze layer completed successfuly'
print 'Total Duration: ' + cast(datediff(second,@batch_start_time,@batch_end_time) as nvarchar) + 'seconds';
end try
begin catch
print '============================================='
print 'Error occured while loading bronze layer.....'
print 'Error Message: ' + error_message();
print 'Error Message: ' + cast(error_number() as nvarchar);
print 'Error Message: ' + cast(error_state() as nvarchar);

print '============================================='
end catch
end

print 'Process ended Successfully=======================================================' 
