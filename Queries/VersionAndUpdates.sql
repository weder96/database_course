-- Returns the version of MS SQL Server running on the instance.
SELECT @@VERSION

--Returns the name of the MS SQL Server instance.
SELECT @@SERVERNAME

-- Returns the name of the Windows service MS SQL Server is running as.
SELECT @@SERVICENAME

-- Returns the physical name of the machine where SQL Server is running. 
-- Useful to identify the node in a failover cluster.
SELECT serverproperty('ComputerNamePhysicalNetBIOS');

SELECT * FROM fn_virtualservernodes();


UPDATE FactInternetSales
SET SalesAmount = (SalesAmount + (SalesAmount*(0.1)))


PRINT 'Hello World!';


/* This is
a multi-line
comment block. */
SELECT Id = 1, [Message] = 'First row'
UNION ALL
SELECT 2, 'Second row'
/* This is a one liner */
SELECT 'More';


-- This is a comment
SELECT *
FROM FactInternetSales -- This is another comment
WHERE [SalesOrderNumber] = 1;

--TRUNCATE TABLE FactInternetSales

UPDATE FactInternetSales 
SET [OrderQuantity] = 2,
    [UnitPrice] = 3578.27,
	[SalesAmount] = 2*3578.27
WHERE [SalesOrderNumber] = 'SO43697'