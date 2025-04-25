-- [SQL Server] Funcaes de Agregacao
-- database => AdventureWorksDW2019
-- Funcao SUM

-- 1. Faca uma consulta que retorna a soma total de OrderQuantity e a soma total de SalesAmount.

SELECT
	SUM(fis.OrderQuantity) AS 'Quantida Vendido',
	SUM(fis.SalesAmount) AS 'Valor Vendido'
FROM
	FactInternetSales fis