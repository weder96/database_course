-- [SQL Server] Introdução ao SQL
-- database => AdventureWorksDW2019
-- SELECT DISTINCT

-- Comando SELECT DISTINCT: Retorna os valores distintos de 1 ou mais colunas de uma tabela

-- Retorne todas as linhas da tabela DimProduct
SELECT * FROM DimProduct

-- Retorne os valores distintos da coluna ColorName da tabela DimProduct
SELECT DISTINCT Color FROM DimProduct



-- Retorne todas as linhas da tabela DimEmployee
SELECT * FROM DimEmployee

-- Retorne os valores distintos da coluna DepartmentName da tabela DimEmployee
SELECT
	DISTINCT DepartmentName
FROM DimEmployee