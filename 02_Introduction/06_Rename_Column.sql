-- [SQL Server] Introdução ao SQL
-- database => AdventureWorksDW2019
-- Renomeando colunas (aliasing)

-- Comando AS: Renomeando colunas (aliasing)

-- Selecione as 3 colunas da tabela DimProduct: ProductName, BrandName e ColorName

SELECT
	EnglishProductName AS Produto,
	Status AS Situacao,
	Color AS Cor
FROM 
	DimProduct