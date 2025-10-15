-- [SQL Server] [Subqueries] Subquery na prática - Aplicação com o SELECT
-- database = AdventureWorksDW2019
-- Exemplo: Retornar uma tabela com todos os produtos (ID Produto e Nome Produto) e também o total de vendas para cada produto

SELECT
	ProductKey,
	EnglishProductName,
	(SELECT COUNT(ProductKey) FROM FactInternetSales sales WHERE sales.ProductKey = pro.ProductKey) AS 'Qtd. Vendas'
FROM
	DimProduct pro