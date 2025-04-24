CREATE PROCEDURE productsByName as
BEGIN
	select 
	pro.ProductAlternateKey,
	pro.EnglishProductName,
	pro.Color, 
	pro.StartDate,
	pro.Status
	from DimProduct pro
	order by pro.EnglishProductName;
END




EXEC productsByName