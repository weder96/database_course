-- Utilize o INNER JOIN para trazer os nomes das subcategorias dos
-- produtos, da tabela DimProductSubcategory para a tabela DimProduct.
select 
distinct 
pro.EnglishProductName,
dps.EnglishProductSubcategoryName,
dps.FrenchProductSubcategoryName,
dps.SpanishProductSubcategoryName
from DimProduct pro 
inner join DimProductSubcategory dps on pro.ProductSubcategoryKey = pro.ProductSubcategoryKey


-- Questão 2
-- Identifique uma coluna em comum entre as tabelas
-- DimProductSubcategory e DimProductCategory. Utilize essa coluna
-- para complementar informações na tabela DimProductSubcategory a
-- partir da DimProductCategory. Utilize o LEFT JOIN.
select 
*
from DimProductSubcategory dps 
left join DimProductCategory dpc on dpc.ProductCategoryKey = dps.ProductCategoryKey



SELECT 
    pro.EnglishProductName,
    SUM(CASE WHEN YEAR(f.OrderDate) = 2011 THEN f.SalesAmount ELSE 0 END) AS Sales2011,
    SUM(CASE WHEN YEAR(f.OrderDate) = 2012 THEN f.SalesAmount ELSE 0 END) AS Sales2012,
    SUM(CASE WHEN YEAR(f.OrderDate) = 2011 THEN f.SalesAmount ELSE 0 END) - 
    SUM(CASE WHEN YEAR(f.OrderDate) = 2012 THEN f.SalesAmount ELSE 0 END) AS SalesDifference
FROM 
    FactInternetSales f
JOIN 
    DimProduct pro ON f.ProductKey = pro.ProductKey
WHERE 
    f.OrderDate BETWEEN '2011-01-01' AND '2013-12-31'
	group by pro.EnglishProductName
ORDER BY 
    SalesDifference DESC;

-- Questão 4
-- Complementa a tabela DimProduct com a informação de
-- ProductCategoryDescription. Utilize o LEFT JOIN e retorne em seu
-- SELECT apenas as 5 colunas que considerar mais relevantes.


-- Questão 5
-- Algumas subcategorias não possuem nenhum exemplar de produto.
-- Identifique que subcategorias são essas.


SELECT 
    top 10
    dc.FirstName,
    YEAR(f.OrderDate) AS SalesYear,
    MONTH(f.OrderDate) AS SalesMonth,
    SUM(f.SalesAmount) AS TotalSales
FROM 
    FactInternetSales f
    INNER JOIN DimCustomer dc on dc.CustomerKey = f.CustomerKey
GROUP BY 
    dc.FirstName,
    YEAR(f.OrderDate), 
    MONTH(f.OrderDate)
    




	-- Para cada loja da tabela [DimSalesTerritory], descubra qual o Continente e o Nome
-- do País associados (de acordo com DimGeography).
--  Utilize o LEFT
-- JOIN neste exercício.

	SELECT TOP (1) [GeographyKey]
      ,[City]
      ,[StateProvinceCode]
      ,[StateProvinceName]
      ,[CountryRegionCode]
      ,[EnglishCountryRegionName]
      ,[SpanishCountryRegionName]
      ,[FrenchCountryRegionName]
      ,[PostalCode]
      ,geo.[SalesTerritoryKey]
      ,[IpAddressLocator],
	  salesTer.*	  
  FROM [AdventureWorksDW2019].[dbo].[DimGeography] geo
  inner join DimSalesTerritory salesTer on salesTer.SalesTerritoryKey = geo.SalesTerritoryKey