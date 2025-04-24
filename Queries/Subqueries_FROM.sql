-- [SQL Server] [Subqueries] : Subquery na prática - Aplicação com o FROM
-- database = AdventureWorksDW2019
-- Exemplo: Retornar a quantidade total de produtos com status Current.

SELECT
	COUNT(*) 
FROM DimProduct
WHERE status = 'Current'

SELECT
	COUNT(*)
FROM (SELECT * FROM DimProduct WHERE status = 'Current') AS T