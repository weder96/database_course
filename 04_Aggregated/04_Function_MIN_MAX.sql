-- [SQL Server] Funcoes de Agregacao
-- database => AdventureWorksDW2019
-- Funcoes MIN e MAX

-- 1. Faca uma consulta que retorna os valores maximo e minimo de ListPrice.

SELECT
	MAX(ListPrice) AS 'Custo Maximo',
	MIN(ListPrice) AS 'Custo Minimo'
FROM
	DimProduct

