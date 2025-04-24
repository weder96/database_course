-- [SQL Server] [Subqueries e CTE's] Criando múltiplas CTE's

-- Exemplo: Crie 2 CTE's:
-- 1. A primeira, cjamada produtos_dw, deve conter as seguintes colunas (DimProduct): ProductKey, EnglishProductName, status
-- 2. A segunda, chamada vendas_top100, deve ser um top 100 vendas mais recentes, considerando as seguintes colunas da tabela FactInternetSales: ProductKey, YEAR(OrderDate), sum(SalesAmount)
-- com order da maiores vendas por somatoria

-- Por fim, faça um INNER JOIN dessas tabelas

WITH produtos_dw AS (
	SELECT
		ProductKey,
		EnglishProductName,
		status
	FROM
		DimProduct
	WHERE
		status = 'Current'
),
vendas_top100 AS (
	SELECT TOP(100)		
		ProductKey,
		YEAR(OrderDate) as 'ano',
		sum(SalesAmount) as 'total'
	FROM
		FactInternetSales fis
		group by ProductKey, YEAR(OrderDate)
		order by  sum(SalesAmount) desc
)
SELECT * FROM vendas_top100 ven
INNER JOIN produtos_dw pro
	ON  ven.ProductKey = pro.ProductKey
	order by ano, pro.ProductKey